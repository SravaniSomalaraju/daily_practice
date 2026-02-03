--Find courses where at least one student is enrolled, but no student has any UserActivity in that course.
select 
    c.course_id,
    c.course_name,
    count(c.course_id) as total_count
from lms.Courses c
join lms.Enrollments e
 on c.course_id = e.course_id
left join lms.Lessons l
    on c.course_id = l.course_id
left join lms.UserActivity ua
    on l.lesson_id = ua.lesson_id
where status = 'active'
group by
    c.course_id,
    c.course_name
having
    count(distinct e.user_id) > 0;



--Find users whose activity is increasing month-over-month based on UserActivity.activity_timestamp.

with over_monthly as(
    select
        user_id,
        year(activity_time) yr,
        month(activity_time) mn,
        count(*) activity_count
    from lms.UserActivity
    group by
        user_id,
        year(activity_time),
        month(activity_time)
 ),
 CompareMonths AS (
    select
        user_id,
        yr,
        mn,
        activity_count,
        LAG(activity_count) OVER (
            partition by user_id
            order by yr, mn
        ) as prev_month_count
    from over_monthly
)
select distinct
    user_id
from CompareMonths
where activity_count > prev_month_count;



--For each course, find the first assessment submission date per user and rank users by earliest submission

--added a new column named submission_time
ALTER TABLE lms.AssesmentSubmissions
ADD submission_time DATETIME NOT NULL DEFAULT GETDATE();

select * from lms.AssesmentSubmissions;

with FirstSubmission as (
    select
        u.user_id,
        u.full_name,
        c.course_id,
        c.course_name,
        min(s.submission_time) as first_submit_time
    from lms.Users u
    join lms.AssesmentSubmissions s
        on u.user_id = s.user_id
    join lms.Assesments a
        on s.assesment_id = a.assesment_id
    join lms.Courses c
        on a.course_id = c.course_id
    group by
        u.user_id,
        u.full_name,
        c.course_id,
        c.course_name
)
select
    user_id,
    full_name,
    course_name,
    first_submit_time,
    dense_rank() over (
        partition by course_id
        order by first_submit_time
    ) as submission_rank
from FirstSubmission
order by
    course_name,
    submission_rank;