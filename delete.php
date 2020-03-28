<?php
require 'db.php';
$id = $_GET['BookId'];
$sql = 'DELETE FROM books WHERE BookId=:BookId';
$statement = $connection->prepare($sql);
if ($statement->execute([':BookId' => $id])) {
  header("Location: bookList.php");
}