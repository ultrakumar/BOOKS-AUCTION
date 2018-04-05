/* 1).
To display the possible number of books based on the departmentname selected in the books table: */

SQL> select b.booktitle,b.description,b.author,b.isbn,b.volume,b.price,b.dateadded,
b.bidingenddate,d.name from books  b join department d on b.DEPTID = d.deptid
and d.deptid = 2; 
/* In this query we have joined books and department table and listed 
out all the books which belong to department number 2 =computer science */

/* 2). Admin report (Display list of books in the application) */

select f.sellerid,u.fname,f.bookid,b.booktitle,f.price,f.receiverid,f.bidprice from 
finalbidding f join books b on b.bookid = f.bookid
join users u on u.userid = f.sellerid;

/*The list of books in the application along with the seller who is selling the book, sell price and the winner of the bidding you has won the books with the bid price gets displayed.*/

/* 3). 
GET THE DETAILS OF THE PERSON WHO WON BUT NOT HAVING BANKING DETAILS UPLOADED */

SELECT U.FNAME,U.MINIT,U.LNAME
FROM USERS U
WHERE EXISTS(SELECT * 
FROM FINALBIDDING F
WHERE U.USERID=F.SELLERID)
AND NOT EXISTS(SELECT *
FROM BANKING_DETAILS B
WHERE U.USERID=B.USERID);

/* 4. Display the numberof books uploaded by a user */
select b.userid,count(*) as numberofbooks from books b join users u on
 u.userid = b.userid group by u.userid 
having count(*)>0;

/* 5. For a selected book display the list of users you has bidded for that book. When the admin selects a booktitle
display the list of persons who has bidded for that book. */ 

select b.booktitle,d.bookid,d.bidinguser,d.bidingdate,d.price from bidding_details d join books b on b.bookid = d.bookid  and d.bookid = 2 
 order by d.bidingdate desc;


/*6 * list of books which has not been bidded in the application */
select b. bookid,b.booktitle,b.author from books b  where  not exists (select f.bookid from finalbidding f where b.bookid = f.bookid);

/*7 * Get all the details of books from a specific department */
select * from books where deptid='5';

/* There is no dept 5 , so the query shows nothing */

/*8 * 	To get the details associated with each number	*/
select * from users join banking_details ON banking_details.USERID
= users.USERID;

/*9 *	Users can get notification from other users	*/
SELECT N.UserID, N.Message,N.BookID, N.DatePosted
	FROM NOTIFICATION  N, Users U
	WHERE N.ReceiverID = U.UserID;

/*10 *	Admin can see the USER WITH SPECIFIC USERID	*/
SELECT Fname, Minit, Lname 
FROM USERS 
WHERE USERID= 'NAYAKA';


/*To select the books with the 5 star rating*/
11.
select BOOKS.BOOKID,books.BOOKTITLE from books join rateservice  ON rateservice.BUYERRATING='5' AND rateservice.SELLERRATING=5;



/*12* Triggers bidding violation	*/
SELECT* FROM USERS
Where userid='admin';
      
			
			
/*13* To get the books with the 5 star rating	*/
select * from books join rateservice  ON rateservice.BUYERRATING='5';

/////
/*14* To get to know the final bidding book	*/
select booktitle from books JOIN finalbidding ON finalbidding.BOOKID=books.bookid;

/*15*	to know all the detials of the users table	*/
select * from users;







