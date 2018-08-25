----------------------------------------------------------------------------------------------
--                                  SIMPLE SQL QUERIES                                      --
----------------------------------------------------------------------------------------------

-- Learning SQL and practicing it through pgexercises.com

----------------------------------------------------------------------------------------------
--                                  JOINS & SUBQUERIES                                      --
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
--                  Exercise 1: Retrieve the start times of members' bookings               --
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
-- How can you produce a list of the start times for bookings by                            --
-- members named 'David Farrell'?                                                           --
----------------------------------------------------------------------------------------------

select starttime 
    from cd.bookings
	inner join cd.members on members.memid = bookings.memid
where members.firstname = 'David'
and members.surname = 'Farrell';

----------------------------------------------------------------------------------------------
--          Exercise 2: Work out the start times of bookings for tennis courts              --
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
-- How can you produce a list of the start times for bookings for tennis courts, for the    --
-- date '2012-09-21'?                                                                       -- 
--                                                                                          --
-- Return a list of start time and facility name pairings, ordered by the time.             --                             --                                                                                          --
----------------------------------------------------------------------------------------------

select bookings.starttime as start, facilities.name as name
	from
		cd.facilities
		inner join cd.bookings 
			on facilities.facid = bookings.facid
	where 
		facilities.facid in (0,1)
		and bookings.starttime >= '2012-09-21'
		and bookings.starttime < '2012-09-22'
order by bookings.starttime;  

----------------------------------------------------------------------------------------------
--      Exercise 3: Produce a list of all members who have recommended another member       --
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
-- How can you output a list of all members who have recommended another member?            --
--                                                                                          --
-- Ensure that there are no duplicates in the list, and that results are ordered by         --
-- (surname, firstname).                                                                    --
----------------------------------------------------------------------------------------------

select distinct recs.firstname as firstname, recs.surname as surname
	from cd.members members
	inner join cd.members recs
		on recs.memid = members.recommendedby
order by surname, firstname;

----------------------------------------------------------------------------------------------
--          Exercise 4: Produce a list of all members, along with their recommender         --
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
-- How can you output a list of all members, including the individual who recommended them  --
-- (if any)?                                                                                --
--                                                                                          --
-- Ensure that results are ordered by (surname, firstname).                                 --
----------------------------------------------------------------------------------------------

select members.firstname as memfname, members.surname as memsname,\
recs.firstname as recfname, recs.surname as recsname
	from cd.members members
	left outer join cd.members recs
		on recs.memid = members.recommendedby
order by memsname, memfname;