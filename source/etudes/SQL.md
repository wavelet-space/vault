# SQL

Solutions for <https://www.hackerrank.com/domains/sql>

See also https://www.kdnuggets.com/2023/01/7-best-platforms-practice-sql.html

Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

```sql
select * from city where population > 100000 and countrycode = 'USA'
```

Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

```sql
select name from city where population > 120000 and countrycode = 'USA'
```

Query all columns (attributes) for every row in the CITY table.

```sql
select * from city
```

Query all columns for a city in CITY with the ID 1661.

```sql
select * from city as c where c.id = 1661  
```

Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

```sql
select * from city as c where c.countrycode = 'JPN'
```

Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

```sql
select name from city as c where c.countrycode = 'JPN'
```

Query a list of CITY and STATE from the STATION table
(LAT_N is the northern latitude and LONG_W is the western longitude).

```sql
select city, state from station
```

Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

```sql
select distinct city from station where mod(id, 2) = 0
```

or

```sql
select city from station where mod(id, 2) = 0 group by city; 
```

The idea is to group according to all columns to be selected in output. F
`DISTINCT` is functionally equivalent to `GROUP BY <all the columns in your select list>`
See <https://dev.mysql.com/doc/refman/8.0/en/distinct-optimization.html>

Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

```sql
select (count(city) - count(distinct city)) from station
```

Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

```sql
select city, length(city) from station where length(city) = (select min(length(city)) from station) order by city asc limit 1; 
select city, length(city) from station where length(city) = (select max(length(city)) from station) order by city asc limit 1;
```

or

```sql
(select city, length(city) from station order by length(city) asc, city asc limit 1)
union
(select  city, length(city) from station order by length(city) desc, city asc limit 1)
```

With allowed duplication we can use something like this:

```sql
select city, length(city) as city_length from station 
where length(city) in (
  (select min(length(city)) from station),
  (select max(length(city)) from station)
) order by city_length
```

Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

```sql
select distinct city from station where 
  city like 'a%' or
  city like 'e%' or 
  city like 'i%' or 
  city like 'o%' or 
  city like 'u%'
```

or

```sql
select distinct city from station where city rlike '^(a|e|i|o|u)'
```

Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

```sql
select distinct city from station where city rlike '(a|e|i|o|u)$'
```

Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

```sql
select distinct city from station where city rlike '^(a|e|i|o|u)' and city rlike '(a|e|i|o|u)$'
```

```sql
select distinct city from station where city rlike '^(a|e|i|o|u).*(a|e|i|o|u)$'
```

Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

```sql
select distinct city from station where city not rlike '^(a|e|i|o|u)'
```

Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.


```sql
select distinct city from station where city not rlike '^(a|e|i|o|u)' or city not rlike '(a|e|i|o|u)$'
```

Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.


```sql
select distinct city from station where city not rlike '^(a|e|i|o|u)' and city not rlike '(a|e|i|o|u)$'
```

Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

```sql
```


Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

```sql
select name from employee order by name asc
```

Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id
```sql
select name from employee 
where months < 10 and salary > 2000
order by employee_id
```


> There are only two kinds of languages: the ones people complain about and the ones nobody uses.</br>
>-- Bjarne Stroustrup
