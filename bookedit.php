<?php
require 'db.php';
$BookId = $_GET['BookId'];
$sql = 'SELECT books.BookDescription,books.BookNumPages,books.BookId,books.BookName,
categories.CategoryName,authors.AuthorName,publishers.PublisherName,books.BookISBN,books.BookPrice,
statusb.status_name FROM books,authors,categories,publishers,statusb WHERE books.CategoryID=categories.CategoryID AND
 books.AuthorID=authors.AuthorID AND books.PublisherID=publishers.PublisherID AND books.BookStatus=statusb.BookStatus
and BookId=:BookId';
$statement = $connection->prepare($sql);
$statement->execute([':BookId'=>$BookId]);
$book = $statement->fetch(PDO::FETCH_OBJ);
if (isset($_POST['BookName']) && isset($_POST['CategoryID']) && isset($_POST['AuthorID']) && isset($_POST['PublisherID']) && isset($_POST['BookDescription']) && isset($_POST['BookPrice']) && isset($_POST['BookNumPages']) && isset($_POST['BookISBN']) && isset($_POST['BookStatus'])){
  $BookName = $_POST['BookName'];
  $CategoryID = $_POST['CategoryID']; 
  $AuthorID = $_POST['AuthorID']; 
  $PublisherID = $_POST['PublisherID']; 
  $BookDescription = $_POST['BookDescription']; 
  $BookPrice = $_POST['BookPrice']; 
  $BookNumPages = $_POST['BookNumPages']; 
  $BookISBN = $_POST['BookISBN']; 
  $BookStatus = $_POST['BookStatus']; 
  $sql = 'UPDATE books SET BookName=:BookName, CategoryID=:CategoryID, AuthorID=:AuthorID, 
  PublisherID=:PublisherID, BookPrice=:BookPrice, BookStatus=:BookStatus, BookNumPages=:BookNumPages, BookISBN=:BookISBN, BookDescription=:BookDescription  WHERE BookId=:BookId';
  $statement = $connection->prepare($sql);
  if ($statement->execute([':BookName'=> $BookName ,':CategoryID' => $CategoryID,':AuthorID' => $AuthorID,':PublisherID' => $PublisherID,':BookDescription' => $BookDescription,
   ':BookPrice'=>$BookPrice,':BookNumPages' => $BookNumPages,':BookISBN' => $BookISBN,':BookStatus' => $BookStatus,':BookId' => $BookId ])) {
    header("Location: BookEditComplete.php?ID={$book->BookId}");
      }


}


 ?>
<?php require 'header.php'; ?>
<div class="container">
  <div class="card mt-5">
    <div class="card-header">
      <h2>แก้ไขรายการหนังสือ</h2>
    </div>
    <div class="card-body">
      <?php if(!empty($message)): ?>
        <div class="alert alert-success">
          <?= $message; ?>
        </div>
      <?php endif; ?>
      <form method="post">
        <div class="form-group">
          <label for="BookName">ชื่อหนังสือ</label>
          <input value="<?= $book->BookName; ?>" type="text" name="BookName" id="BookName"  class="form-control" >
        </div>
        <div class="form-group">
          <label for="CategoryID">ประเภท</label>
           <select name="CategoryID">
                <option value="<?= $book->CategoryID; ?>" ><?= $book->CategoryName; ?></option>
                <option value="1">นิยาย</option>;
                <option value="2">จิตวิทยา/พัฒนาตนเอง</option>;
                <option value="3">อาหารและสุขภาพ</option>;
           </select>
        </div>
        <div class="form-group">
          <label for="AuthorID">ผู้แต่ง</label>
          <select name="AuthorID">
                <option value="<?= $book->AuthorID; ?>" ><?= $book->AuthorName; ?></option>
                <option value="1">Haruki Murakami</option>;             
                <option value="2">Malcolm Gladwell</option>;             
                <option value="3">Meg Jay</option>;             
                <option value="4">นายแพทย์จางเหวินหง</option>;             
                <option value="5">Charles Duhigg</option>;             
                <option value="6">Higashino Keigo</option>;             
                <option value="7">Matthew Walker</option>;             
           </select>
        </div>
        <div class="form-group">
          <label for="PublisherID">สำนักพิมพ์</label>
          <select name="PublisherID">
                <option value="<?= $book->PublisherID; ?>" ><?= $book->PublisherName; ?></option>
                <option value="1">สำนักพิมพ์กำมะหยี่</option>;             
                <option value="2">สำนักพิมพ์วีเลิร์น</option>;             
                <option value="3">สำนักพิมพ์ Amarin Health</option>;             
                <option value="4">น้ำพุสำนักพิมพ์</option>;             
                <option value="5">บุ๊คสเคป</option>;             
           </select>
           <div class="form-group">
          <label for="BookDescription">คำอธิบาย</label>
          <textarea type="text" name="BookDescription" id="BookDescription" class="form-control" required>
            <?= $book->BookDescription; ?>"
          </textarea></div>
        <div class="form-group">
          <label for="BookPrice">ราคา</label>
          <input type="text" value="<?= $book->BookPrice; ?>" name="BookPrice" id="BookPrice" class="form-control">
        </div>
        <div class="form-group">
          <label for="BookNumPages">จำนวนหน้า</label>
          <input value="<?= $book->BookNumPages; ?>" type="text" name="BookNumPages" id="BookNumPages" class="form-control" required></div>
          <div class="form-group">
          <label for="BookISBN">ISBN</label>
          <input value="<?= $book->BookISBN; ?>" type="text" name="BookISBN" id="BookISBN" class="form-control" required></div>
        <div class="form-group" require>
                  <label for="BookStatus">สถานะการขาย</label>
                  <input  type="radio" name="BookStatus"id="BookStatus" value="0" class="frome-control" >  เลิกจำหน่าย
                  <input  type="radio" name="BookStatus"id="BookStatus" value="1" class="frome-control">  ปกติ
        </div>
        
        <div class="form-group">
          <button type="submit" class="btn btn-info">บันทึก</button>  <button type="submit" class="btn btn-info"a href="bookList.php">ยกเลิก</button>
          
        </div>
      </form>
    </div>
  </div>
</div>
<?php require 'footer.php'; ?>