--1. Profile the data by finding the total number of records for each of the tables below:

--Code: 
	SELECT (
    SELECT COUNT(*)
    FROM attribute
    ) AS attribute_count,

    (
    SELECT COUNT(*)
    FROM business
    ) AS business_count,

    (
    SELECT COUNT(*)
    FROM category
    ) AS category_count,

    (
    SELECT COUNT(*)
    FROM checkin
    ) AS checkin_count,

    (
    SELECT COUNT(*)
    FROM elite_years
    ) AS elite_years_count,

    (
    SELECT COUNT(*)
    FROM friend
    ) AS friend_count,

    (
    SELECT COUNT(*)
    FROM hours
    ) AS hours_count,

    (
    SELECT COUNT(*)
    FROM photo
    ) AS photo_count,

    (
    SELECT COUNT(*)
    FROM review
    ) AS review_count,

    (
    SELECT COUNT(*)
    FROM tip
    ) AS tip_count,

    (
    SELECT COUNT(*)
    FROM user
    ) AS user_count

    
    
--Output:
+-----------------+----------------+----------------+---------------+-------------------+--------------+-------------+-------------+--------------+-----------+------------+
| attribute_count | business_count | category_count | checkin_count | elite_years_count | friend_count | hours_count | photo_count | review_count | tip_count | user_count |
+-----------------+----------------+----------------+---------------+-------------------+--------------+-------------+-------------+--------------+-----------+------------+
|           10000 |          10000 |          10000 |         10000 |             10000 |        10000 |       10000 |       10000 |        10000 |     10000 |      10000 |
+-----------------+----------------+----------------+---------------+-------------------+--------------+-------------+-------------+--------------+-----------+------------+
i. Attribute table=10000
ii. Business table =10000
iii. Category table=10000
iv. Checkin table =10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000



--2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.
--Code:
SELECT
    (SELECT COUNT(DISTINCT id)
    FROM business
    ) AS bus_pkey_bus_id,
    
    (SELECT COUNT(DISTINCT business_id)
    FROM hours
    ) AS hou_fkey_bus_id,

    (SELECT COUNT(DISTINCT business_id)
    FROM category
    ) AS cat_fkey_bus_id,

    (SELECT COUNT(DISTINCT business_id)
    FROM attribute
    )AS att_fkey_bus_id,

    (SELECT COUNT(DISTINCT id)
    FROM review
    ) AS rev_pkey_id,

    (SELECT COUNT(DISTINCT business_id)
    FROM checkin
    )AS chk_fkey_bus_id,

    (SELECT COUNT(DISTINCT id)
    FROM photo
    )AS pho_pkey_id,

    (SELECT COUNT(DISTINCT business_id)
    FROM tip
    ) AS tip_fkey_bus_id,

    (SELECT COUNT(DISTINCT id)
    FROM user
    ) AS usr_pkey_id,

    (SELECT COUNT(DISTINCT user_id)
    FROM friend
    ) AS frn_fkey_usrid,

    (SELECT COUNT(DISTINCT user_id)
    FROM elite_years
    ) AS elt_fkey_usrid

--Output
+-----------------+-----------------+-----------------+-----------------+-------------+-----------------+-------------+-----------------+-------------+----------------+----------------+
| bus_pkey_bus_id | hou_fkey_bus_id | cat_fkey_bus_id | att_fkey_bus_id | rev_pkey_id | chk_fkey_bus_id | pho_pkey_id | tip_fkey_bus_id | usr_pkey_id | frn_fkey_usrid | elt_fkey_usrid |
+-----------------+-----------------+-----------------+-----------------+-------------+-----------------+-------------+-----------------+-------------+----------------+----------------+
|           10000 |            1562 |            2643 |            1115 |       10000 |             493 |       10000 |            3979 |       10000 |             11 |           2780 |
+-----------------+-----------------+-----------------+-----------------+-------------+-----------------+-------------+-----------------+-------------+----------------+----------------+
i. Business = 10000
ii. Hours = 1562
iii. Category = 2643
iv. Attribute = 1115
v. Review = 10000
vi. Checkin = 493
vii. Photo = 10000
viii. Tip = 3979
ix. User = 10000
x. Friend = 11
xi. Elite_years = 2780

--3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No
	
	
	SQL code used to arrive at answer:
	
SELECT 
    SUM(CASE WHEN id ISNULL THEN 1 ELSE 0 END) AS null_id ,
    SUM(CASE WHEN name ISNULL THEN 1 ELSE 0 END) AS null_name,
    SUM(CASE WHEN review_count ISNULL THEN 1 ELSE 0 END) AS null_review_count,
    SUM(CASE WHEN yelping_since ISNULL THEN 1 ELSE 0 END) AS null_yelping_since,
    SUM(CASE WHEN useful ISNULL THEN 1 ELSE 0 END) AS null_useful ,
    SUM(CASE WHEN funny ISNULL THEN 1 ELSE 0 END) AS null_funny ,
    SUM(CASE WHEN cool ISNULL THEN 1 ELSE 0 END) AS null_cool ,
    SUM(CASE WHEN fans ISNULL THEN 1 ELSE 0 END) AS null_fans ,
    SUM(CASE WHEN average_stars ISNULL THEN 1 ELSE 0 END) AS null_average_stars ,
    SUM(CASE WHEN compliment_hot ISNULL THEN 1 ELSE 0 END) AS null_compliment_hot ,
    SUM(CASE WHEN compliment_more ISNULL THEN 1 ELSE 0 END) AS null_compliment_more ,
    SUM(CASE WHEN compliment_profile ISNULL THEN 1 ELSE 0 END) AS null_compliment_profile,
    SUM(CASE WHEN compliment_cute ISNULL THEN 1 ELSE 0 END) AS null_compliment_cute,
    SUM(CASE WHEN compliment_list ISNULL THEN 1 ELSE 0 END) AS null_compliment_list,
    SUM(CASE WHEN compliment_note ISNULL THEN 1 ELSE 0 END) AS null_compliment_note,
    SUM(CASE WHEN compliment_plain ISNULL THEN 1 ELSE 0 END) AS null_compliment_plain,
    SUM(CASE WHEN compliment_cool ISNULL THEN 1 ELSE 0 END) AS null_compliment_cool,
    SUM(CASE WHEN compliment_funny ISNULL THEN 1 ELSE 0 END) AS null_compliment_funny,
    SUM(CASE WHEN compliment_writer ISNULL THEN 1 ELSE 0 END) AS null_compliment_writer,
    SUM(CASE WHEN compliment_photos ISNULL THEN 1 ELSE 0 END) AS null_compliment_photos  
FROM user

--Output:
+---------+-----------+-------------------+--------------------+-------------+------------+-----------+-----------+--------------------+---------------------+----------------------+-------------------------+----------------------+----------------------+----------------------+-----------------------+----------------------+-----------------------+------------------------+------------------------+
| null_id | null_name | null_review_count | null_yelping_since | null_useful | null_funny | null_cool | null_fans | null_average_stars | null_compliment_hot | null_compliment_more | null_compliment_profile | null_compliment_cute | null_compliment_list | null_compliment_note | null_compliment_plain | null_compliment_cool | null_compliment_funny | null_compliment_writer | null_compliment_photos |
+---------+-----------+-------------------+--------------------+-------------+------------+-----------+-----------+--------------------+---------------------+----------------------+-------------------------+----------------------+----------------------+----------------------+-----------------------+----------------------+-----------------------+------------------------+------------------------+
|       0 |         0 |                 0 |                  0 |           0 |          0 |         0 |         0 |                  0 |                   0 |                    0 |                       0 |                    0 |                    0 |                    0 |                     0 |                    0 |                     0 |                      0 |                      0 |
+---------+-----------+-------------------+--------------------+-------------+------------+-----------+-----------+--------------------+---------------------+----------------------+-------------------------+----------------------+----------------------+----------------------+-----------------------+----------------------+-----------------------+------------------------+------------------------+

i. Business = 0
ii. Hours = 0
iii. Category =0
iv. Attribute =0
v. Review =0
vi. Checkin = 0
vii. Photo =0
viii. Tip = 0
ix. User = 0
x. Friend = 0
xi. Elite_years =0
	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
	SELECT MIN(stars),MAX(stars),AVG(stars)
	FROM review
	
		min:1.0		max:5.0		avg:3.7082
		
	
	ii. Table: Business, Column: Stars
	
	SELECT MIN(stars),MAX(stars),AVG(stars)
	FROM business
	
	
		min:1.0		max:5.0		avg:3.6549
		
	
	iii. Table: Tip, Column: Likes

	SELECT MIN(likes),MAX(likes),AVG(likes)
	FROM tip
	
		min:0		max:2		avg:0.0144
		
	
	iv. Table: Checkin, Column: Count
	
	SELECT MIN(count),MAX(count),AVG(count)
	FROM checkin
		min:1		max:53		avg:1.9414
		
	
	v. Table: User, Column: Review_count
	
	SELECT MIN(review_count),MAX(review_count),AVG(review_count)
	FROM user
	
		min:0		max:2000		avg:24.2995
		
		
		
5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	
	SELECT city,review_count
	FROM business
	ORDER BY review_count DESC
	
	
	Copy and Paste the Result Below:
	
	+------------+--------------+
	| city       | review_count |
	+------------+--------------+
	| Las Vegas  |         3873 |
	| Montréal   |         1757 |
	| Gilbert    |         1549 |
	| Las Vegas  |         1410 |
	| Las Vegas  |         1389 |
	| Las Vegas  |         1252 |
	| Las Vegas  |         1116 |
	| Las Vegas  |         1084 |
	| Las Vegas  |          961 |
	| Gilbert    |          902 |
	| Las Vegas  |          864 |
	| Scottsdale |          823 |
	| Las Vegas  |          821 |
	| Las Vegas  |          786 |
	| Henderson  |          785 |
	| Toronto    |          778 |
	| Las Vegas  |          768 |
	| Las Vegas  |          758 |
	| Scottsdale |          726 |
	| Cleveland  |          723 |
	| Las Vegas  |          720 |
	| Charlotte  |          715 |
	| Phoenix    |          711 |
	| Las Vegas  |          706 |
	| Phoenix    |          700 |
	+------------+--------------+
	(Output limit exceeded, 25 of 10000 total rows shown)
	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

	SELECT stars,review_count
	FROM business
	WHERE city='Avon'


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

	+-------+--------------+
	| stars | review_count |
	+-------+--------------+
	|   2.5 |            3 |
	|   4.0 |            4 |
	|   5.0 |            3 |
	|   3.5 |            7 |
	|   1.5 |           10 |
	|   3.5 |           31 |
	|   4.5 |           31 |
	|   3.5 |           50 |
	|   2.5 |            3 |
	|   4.0 |           17 |
	+-------+--------------+

ii. Beachwood

SQL code used to arrive at answer:

	SELECT stars,review_count
	FROM business
	WHERE city='Beachwood'

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
		
	+-------+--------------+
	| stars | review_count |
	+-------+--------------+
	|   3.0 |            8 |
	|   3.0 |            3 |
	|   4.5 |           14 |
	|   5.0 |            6 |
	|   4.0 |           69 |
	|   4.5 |            3 |
	|   5.0 |            4 |
	|   2.0 |            8 |
	|   3.5 |            3 |
	|   3.5 |            3 |
	|   5.0 |            6 |
	|   2.5 |            3 |
	|   5.0 |            3 |
	|   5.0 |            4 |
	+-------+--------------+

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	
		SELECT name,review_count
		FROM user
		ORDER BY review_count DESC
		LIMIT 3
		
		
	Copy and Paste the Result Below:
	
		+--------+--------------+
		| name   | review_count |
		+--------+--------------+
		| Gerald |         2000 |
		| Sara   |         1629 |
		| Yuri   |         1339 |
		+--------+--------------+


8. Does posing more reviews correlate with more fans?

	CODE_1:	SELECT name,sum(review_count),sum(fans)
			FROM user
			group by name
			order by sum(review_count) DESC
			LIMIT 5;
	OUTPUT_1: 	+--------+-------------------+-----------+
				| name   | sum(review_count) | sum(fans) |
				+--------+-------------------+-----------+
				| Nicole |              2397 |       200 |
				| Sara   |              2253 |        72 |
				| Gerald |              2034 |       256 |
				| Lisa   |              2021 |       207 |
				| Mark   |              1945 |       156 |
				+--------+-------------------+-----------+
	CODE_2:	SELECT name,sum(review_count),sum(fans)
			FROM user
			group by name
			order by sum(fans) DESC
			LIMIT 5;
	OUTPUT_2:	+--------+-------------------+-----------+
				| name   | sum(review_count) | sum(fans) |
				+--------+-------------------+-----------+
				| Amy    |              1158 |       519 |
				| Mimi   |              1010 |       498 |
				| Harald |              1161 |       311 |
				| Gerald |              2034 |       256 |
				| Lisa   |              2021 |       207 |
				+--------+-------------------+-----------+

	Please explain your findings and interpretation of the results: 
	
	No, You can clearly see the OUTPUT_1 and OUTPUT_2 does not shows any correlation with each other.
	There is no clear ternd that tells anything about the influence one over other. For example Sara has 2nd highest reviwe count but her fiends count is only 72.
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: Yes.
	
	Output: +------------+------------+
			| love_count | hate_count |
			+------------+------------+
			|       1780 |        232 |
			+------------+------------+

	
	SQL code used to arrive at answer: 
	SELECT
	(
	SELECT count(*)
	FROM review
	Where text like '%love%'
	) as love_count,
	
	(
	SELECT count(*)
	FROM review
	Where text like '%hate%'
	) as hate_count

10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	
		SELECT name,SUM(fans)
		FROM user
		GROUP BY name
		ORDER BY SUM(fans) DESC
		LIMIT 10;
	
	Copy and Paste the Result Below:
		+-----------+-----------+
		| name      | SUM(fans) |
		+-----------+-----------+
		| Amy       |       519 |
		| Mimi      |       498 |
		| Harald    |       311 |
		| Gerald    |       256 |
		| Lisa      |       207 |
		| Nicole    |       200 |
		| Christine |       187 |
		| Mark      |       156 |
		| Jen       |       148 |
		| Linda     |       148 |
		+-----------+-----------+
		
		
Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
	CODE:
	--GROUP:1--
	--For the city Las Vegas and Category Shopping of star rating between 4 and 5:  
	
		SELECT id,name,stars,category,hours,review_count,neighborhood
		FROM ((business B INNER JOIN category C ON B.id=C.business_id)
		INNER JOIN hours H ON B.id=H.business_id)
		WHERE category='Shopping' AND city='Las Vegas' AND stars<=5 AND stars>=4
		ORDER BY review_count DESC
		
		+------------------------+--------------------------------+-------+----------+----------------------+--------------+--------------+
		| id                     | name                           | stars | category | hours                | review_count | neighborhood |
		+------------------------+--------------------------------+-------+----------+----------------------+--------------+--------------+
		| 0K2rKvqdBmiOAUTebcUohQ | Red Rock Canyon Visitor Center |   4.5 | Shopping | Monday|8:00-16:30    |           32 |              |
		| 0K2rKvqdBmiOAUTebcUohQ | Red Rock Canyon Visitor Center |   4.5 | Shopping | Tuesday|8:00-16:30   |           32 |              |
		| 0K2rKvqdBmiOAUTebcUohQ | Red Rock Canyon Visitor Center |   4.5 | Shopping | Friday|8:00-16:30    |           32 |              |
		| 0K2rKvqdBmiOAUTebcUohQ | Red Rock Canyon Visitor Center |   4.5 | Shopping | Wednesday|8:00-16:30 |           32 |              |
		| 0K2rKvqdBmiOAUTebcUohQ | Red Rock Canyon Visitor Center |   4.5 | Shopping | Thursday|8:00-16:30  |           32 |              |
		| 0K2rKvqdBmiOAUTebcUohQ | Red Rock Canyon Visitor Center |   4.5 | Shopping | Sunday|8:00-16:30    |           32 |              |
		| 0K2rKvqdBmiOAUTebcUohQ | Red Rock Canyon Visitor Center |   4.5 | Shopping | Saturday|8:00-16:30  |           32 |              |
		| 2RhICgMZI6DK-t374VRoow | Desert Medical Equipment       |   5.0 | Shopping | Friday|8:00-17:00    |            4 |              |
		| 2RhICgMZI6DK-t374VRoow | Desert Medical Equipment       |   5.0 | Shopping | Tuesday|8:00-17:00   |            4 |              |
		| 2RhICgMZI6DK-t374VRoow | Desert Medical Equipment       |   5.0 | Shopping | Thursday|8:00-17:00  |            4 |              |
		| 2RhICgMZI6DK-t374VRoow | Desert Medical Equipment       |   5.0 | Shopping | Wednesday|8:00-17:00 |            4 |              |
		| 2RhICgMZI6DK-t374VRoow | Desert Medical Equipment       |   5.0 | Shopping | Monday|8:00-17:00    |            4 |              |
		+------------------------+--------------------------------+-------+----------+----------------------+--------------+--------------+
		
	--GROUP:2--
	--For the city Las Vegas and Category Shopping of star rating between 2 and 3:  
	
		SELECT id,name,stars,category,hours,review_count,neighborhood
		FROM ((business B INNER JOIN category C ON B.id=C.business_id)
		INNER JOIN hours H ON B.id=H.business_id)
		WHERE category='Shopping' AND city='Las Vegas' AND stars<=3 AND stars>=2
		ORDER BY review_count DESC
		
		+------------------------+-----------+-------+----------+----------------------+--------------+--------------+
		| id                     | name      | stars | category | hours                | review_count | neighborhood |
		+------------------------+-----------+-------+----------+----------------------+--------------+--------------+
		| 1q44aWEcDN7uRvA2l8xpvQ | Walgreens |   2.5 | Shopping | Monday|8:00-22:00    |            6 | Eastside     |
		| 1q44aWEcDN7uRvA2l8xpvQ | Walgreens |   2.5 | Shopping | Tuesday|8:00-22:00   |            6 | Eastside     |
		| 1q44aWEcDN7uRvA2l8xpvQ | Walgreens |   2.5 | Shopping | Friday|8:00-22:00    |            6 | Eastside     |
		| 1q44aWEcDN7uRvA2l8xpvQ | Walgreens |   2.5 | Shopping | Wednesday|8:00-22:00 |            6 | Eastside     |
		| 1q44aWEcDN7uRvA2l8xpvQ | Walgreens |   2.5 | Shopping | Thursday|8:00-22:00  |            6 | Eastside     |
		| 1q44aWEcDN7uRvA2l8xpvQ | Walgreens |   2.5 | Shopping | Sunday|8:00-22:00    |            6 | Eastside     |
		| 1q44aWEcDN7uRvA2l8xpvQ | Walgreens |   2.5 | Shopping | Saturday|8:00-22:00  |            6 | Eastside     |
		+------------------------+-----------+-------+----------+----------------------+--------------+--------------+
		
i. Do the two groups you chose to analyze have a different distribution of hours?
	
ANS: Yes, In the first group business opens for less hour but in 2nd group it open for longer hours.


ii. Do the two groups you chose to analyze have a different number of reviews?

ANS: Not strongly as per the data. In 1st group some business has high rating even it has less reviews.
         
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

--ANS: As in the 1st group data is not available about neighborhood, so I can't comment on this.

2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
		Let GROUP-1: Closed (is_open=0)
			GROUP-2: Open 	(is_open=1)
i. Difference 1:
		Overall percentage stars ratig of group-1 is 3.66 whereas GROUP-2 has higher 3.89
         
        CODE:
		--GROUP-1
			SELECT sum(stars)/count(id)
			FROM business
			WHERE is_open=0
			ORDER BY sum(stars)/count(id) DESC
			
		--GROUP-2
			SELECT sum(stars)/count(id)
			FROM business
			WHERE is_open=1 
			ORDER BY sum(stars)/count(id) DESC
		
ii. Difference 2:
		
		GROUP-1 has average cool review 7 and GROUP-2 has 11.
			So, customers more attracted towards the higher cool rating bussiness.

		CODE:
		SELECT(
			SELECT sum(R.cool)/count(B.id)
			FROM business B INNER JOIN review R ON B.id=R.business_id
			WHERE is_open=0
			GROUP BY cool
			ORDER BY sum(R.cool)/count(B.id) DESC) AS closed,
			(
			SELECT sum(R.cool)/count(B.id)
			FROM business B INNER JOIN review R ON B.id=R.business_id
			WHERE is_open=1
			GROUP BY cool
			ORDER BY sum(R.cool)/count(B.id) DESC) AS opened
		
		OUTPUT:
			+--------+--------+
			| closed | opened |
			+--------+--------+
			|      7 |     11 |
			+--------+--------+

3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:

        clustering businesses to find commonalities or anomalies between them
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

        The tables needed for the analysis are business,category and attribute. 
		Why?
		The business can be easly analysed and clustered based on the attribute like ambience they are offering, price range, age limit soon.
		This analysis will be helpful for the types of business exist in a city and which type of new business can be install in future.
		comparing different business cluster with each other and get to know the future growth.
		
                  
iii. Output of your finished dataset:

	Analysis:1. Comparison of most review_count to least review_count.
		The business having most review_count are neighborhood of The Strip.
	
	Code: 	SELECT id,review_count,stars,neighborhood
			from business
			order by review_count DESC
	output:
			+------------------------+--------------+-------+--------------------+
			| id                     | review_count | stars | neighborhood       |
			+------------------------+--------------+-------+--------------------+
			| 2weQS-RnoOBhb1KsHKyoSQ |         3873 |   3.5 | The Strip          |
			| 0W4lkclzZThpx3V65bVgig |         1757 |   4.0 | Plateau-Mont-Royal |
			| 0FUtlsQrJI7LhqDPxLumEw |         1549 |   4.0 |                    |
			| 2iTsRqUsPGRH1li1WVRvKQ |         1410 |   4.5 | Downtown           |
			| --9e1ONYQuAa-CB_Rrw7Tw |         1389 |   4.0 | The Strip          |
			| -ed0Yc9on37RoIoG2ZgxBA |         1252 |   4.0 | Downtown           |
			| 0NmTwqYEQiKErDv4a55obg |         1116 |   4.0 | The Strip          |
			| 0AQnRQw34IQW9-1gJkYnMA |         1084 |   3.0 | The Strip          |
			| -U7tvCtaraTQ9b0zBhpBMA |          961 |   2.5 | The Strip          |
			| -6tvduBzjLI1ISfs3F_qTg |          902 |   4.0 |                    |
			| 364hhL5st0LV16UcBHRJ3A |          864 |   4.5 |                    |
			| -FLnsWAa4AGEW4NgE8Fqew |          823 |   3.5 |                    |
			| 2sx52lDoiEtef7xgPCaoBw |          821 |   4.5 | Downtown           |
			| 0_aeYE2-VbsZts_UpILgDw |          786 |   4.0 | South Summerlin    |
			| 0ldxjei8v4q95fApIei3Lg |          785 |   4.0 | Anthem             |
			| -av1lZI1JDY_RZN2eTMnWg |          778 |   3.5 | Downtown Core      |
			| 1ZnVfS-qP19upP_fwOhZsA |          768 |   4.0 | Chinatown          |
			| 0q_BHpxbikVtPRRLRu-U0g |          758 |   4.5 | The Strip          |
			| 1d6c6Q2j2jwVzBfX_dLHlg |          726 |   4.0 |                    |
			| -Eu04UHRqmGGyvYRDY8-tg |          723 |   4.5 | Ohio City          |
			| 0d0i0FaJq1GIeW1rS2D-5w |          720 |   4.5 | The Strip          |
			| 01fuY2NNscttoTxOYbuZXw |          715 |   4.0 |                    |
			| -Ht7HiGBox8lS1Y8IPjO8g |          711 |   4.0 |                    |
			| -IWsoxH7mLJTTpU5MmWY4w |          706 |   4.0 | Chinatown          |
			| -050d_XIor1NpCuWkbIVaQ |          700 |   4.0 |                    |
			+------------------------+--------------+-------+--------------------+
			(Output limit exceeded, 25 of 10000 total rows shown)
			
	Analysis:2. comparision of reviw count with stars
		5 star resturent has very few numbers of review count.
		Most review_count count is of 4 stars resturent.
		code:
		SELECT stars,SUM(review_count)
		from business B INNER Join attribute A ON B.id=A.business_id
		group BY stars
		
		output: +-------+-------------------+
				| stars | SUM(review_count) |
				+-------+-------------------+
				|   1.0 |                20 |
				|   1.5 |                28 |
				|   2.0 |               385 |
				|   2.5 |              1397 |
				|   3.0 |              9603 |
				|   3.5 |              7241 |
				|   4.0 |             21131 |
				|   4.5 |               427 |
				|   5.0 |               341 |
				+-------+-------------------+
	
	Analysis 3: Business clustering as per price range
	There are more no. of businesses are of medium(2) price range.

		+-------+--------------------+
		| value | count(business_id) |
		+-------+--------------------+
		| 1     |                260 |
		| 2     |                438 |
		| 3     |                 81 |
		| 4     |                 13 |
		+-------+--------------------+
	
	Code:1
		SELECT value,count(business_id)
		FROM attribute
		WHERE name='RestaurantsPriceRange2'
		GROUP BY value
		
	