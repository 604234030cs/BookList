<?php 
require 'db.php';
$id = $_GET['ID'];
$sql = 'SELECT books.BookDescription,books.BookNumPages,books.BookId,books.BookName,statusb.status_name,
categories.CategoryName,authors.AuthorName,publishers.PublisherName,books.BookISBN,books.BookPrice,
statusb.status_name FROM books,authors,categories,publishers,statusb WHERE books.CategoryID=categories.CategoryID AND
 books.AuthorID=authors.AuthorID AND books.PublisherID=publishers.PublisherID AND books.BookStatus=statusb.BookStatus
and BookId=:ID';
$statement = $connection->prepare($sql);
$statement->execute([':ID'=>$id]);
$book = $statement->fetch(PDO::FETCH_OBJ);
?>
<?php require 'header.php'; ?>

        <div class="container">
        <div class="card mt-5">
        <div class="card-header">
            <h1>ข้อมูลหนังสือ</h1>
        </div>
        <div class="card-body">
        <div class="row">
         <div class="col w3-text-gray">
            <p>ชื่อหนังสือ</p>
        </div>
        <div class="col-10">
            <p><?= $book->BookName; ?></p>
        </div>
        </div>
        <div class="row">
        <div class="col w3-text-gray">
            <p>ผู้แต่ง</p>
        </div>
        <div class="col-10">
            <p><?= $book->AuthorName; ?></p>
        </div>
    </div>
    <div class="row">
        <div class="col w3-text-gray">
            <p>ประเภทหนังสือ</p>
        </div>
        <div class="col-10">
            <p><?= $book->CategoryName; ?></p>
        </div>
    </div>
    <div class="row">
        <div class="col w3-text-gray">
            <p>สำนักพิมพ์</p>
        </div>
        <div class="col-10">
            <p><?= $book->PublisherName; ?></p>
        </div>
    </div>
    <div class="row">
        <div class="col w3-text-gray">
            <p>คำอธิบาย</p>
        </div>
        <div class="col-10">
            <p><?= $book->BookDescription; ?></p>
        </div>
    </div>
    <div class="row">
        <div class="col w3-text-gray">
            <p>ราคา</p>
        </div>
        <div class="col-10">
            <p><?= $book->BookPrice; ?></p>
        </div>
    </div>
    <div class="row">
        <div class="col w3-text-gray">
            <p>สถานะการขาย</p>
        </div>
        <div class="col-10">
            <p><?= $book->status_name; ?></p>
        </div>
    </div>
    <div class="row">
        <div class="col w3-text-gray">
            <p>ISBN</p>
        </div>
        <div class="col-10">
            <p><?= $book->BookISBN; ?></p>
        </div>
    </div>
    <div class="row">
        <div class="col w3-text-gray">
            <p>จำนวนหน้า</p>
        </div>
        <div class="col-10">
            <p><?= $book->BookNumPages; ?></p>
        </div>
    </div>
    <td>
    <center><a href="bookList.php">หน้าหลัก</a></center>
    </td>

        
       
