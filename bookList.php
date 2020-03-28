<?php
require 'db.php';
$sql = "SELECT books.BookId,books.BookName,categories.CategoryName,authors.AuthorName,publishers.PublisherName,books.BookISBN,books.BookPrice,statusb.status_name FROM books,authors,categories,publishers,statusb WHERE books.CategoryID=categories.CategoryID AND books.AuthorID=authors.AuthorID AND books.PublisherID=publishers.PublisherID AND books.BookStatus=statusb.BookStatus
";
$statement = $connection->prepare($sql);
$statement->execute();
$book = $statement->fetchAll(PDO::FETCH_OBJ);
 ?>
 <?php require 'header.php'; ?>
<div class="container">
  <div class="card mt-5">
    <div class="card-header">
    <center><h2>รายการหนังสือ </h2></center>  
    </div>
    <div class="cardtainer">
      <table class="table table-bordered">
        <tr>
          <th>ชื่อหนังสือ</th>
          <th>ผู้เเต่ง</th>
          <th>ประเภทหนังสือ</th>
          <th>สำนักพิมพ์</th>
          <th>ราคา</th>
          <th>สถานะ</th>
        </tr>
        <?php foreach($book as $books): ?>
          <tr>

            <td><?= $books->BookName; ?></td>
            <td><?= $books->AuthorName; ?></td>
            <td><?= $books->CategoryName; ?></td>
            <td><?= $books->PublisherName; ?></td>
            <td><?= $books->BookPrice; ?></td>
            <td><?= $books->status_name; ?></td>
            <td>
              <a href="bookedit.php?BookId=<?= $books->BookId ?>" class="btn btn-info">Edit</a>
              <a onclick="return confirm('Are you sure you want to delete this entry?')" href="delete.php?BookId=<?= $books->BookId ?>" class='btn btn-danger'>Delete</a>
            </td>
          </tr>
        <?php endforeach; ?>
      </table>
    </div>
  </div>
</div>
<?php require 'footer.php'; ?>