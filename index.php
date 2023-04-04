<!DOCTYPE html>
<html>
<head>
	<title>Ivan Store</title>
</head>
<body>
	<section id="mainFilter"> 
		<form action="get1.php" method="get">
		<label for="vendor">Choose your vendor:</label>
		<select name="vendor" id="vendor">
			<?php
				include('connect.php');
				try {
					$stmt = $dbh->query("SELECT ID_Vendors, v_name FROM vendors");
					$res = $stmt->fetchAll();

					foreach($res as $row)
					{
						echo "<option value='$row[0]'>$row[1]</option>";
					}
				}
				catch(PDOException $ex) {
					echo $ex->GetMessage();
				}

				$dbh = null;
			?>
		</select>
		<input type="submit" value="Найти товары">
		</form><br>
		<form action="get2.php" method="get">
			<label for="category">Choose you type:</label>
			<select name="category" id="category">
				<?php
					include('connect.php');
					try {
						$stmt = $dbh->query("SELECT ID_Category, c_name FROM category");
						$res = $stmt->fetchAll();

						foreach($res as $row)
						{
							echo "<option value='$row[0]'>$row[1]</option>";
						}
					}
					catch(PDOException $ex) {
						echo $ex->GetMessage();
					}

					$dbh = null;
				?>
			</select>
			<input type="submit" value="Найти товары">
		</form><br>
		<form action="get3.php" method="get">

			<label for="min_price">Minimal price:</label>
			<input type="number"min="0" max="5000" name="min_price" id="min_price" style="width: 75px">

			<label for="max_price">Maximum price:</label>
			<input type="number" min="130"max="5000"name="max_price" id="max_price">
			<input type="submit" value="Найти товары">
		</form>
	</section>
</body>
</html>
