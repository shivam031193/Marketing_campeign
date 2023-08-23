use marketing_data;
select * from marketing_data.marketing_campaign;
describe marketing_campaign;

select count(*) from marketing_campaign;
select count(ID), count(distinct ID) from marketing_campaign;

select Kidhome, count(*) from marketing_campaign
group by (kidhome);

set sql_safe_updates = 0;

#Version control
create table marketing_campaign_v1
select *,
( case
when complain = 0 then 'No'
when complain = 1 then 'Yes'
end) as complain_new
from marketing_campaign;

select * from marketing_campaign_v1;

alter table marketing_campaign_v1 drop column complain;
select * from marketing_campaign_v1;

# Response Version
create table marketing_campaign_v2
select *,
( case
when response = 0 then 'No'
when response then 'Yes'
end) as response_new
from marketing_campaign_v1;

Select * from marketing_campaign_v2;
alter table marketing_campaign_v2 drop column Response;
select * from marketing_campaign_v2;

select count(*) from marketing_campaign_v2;