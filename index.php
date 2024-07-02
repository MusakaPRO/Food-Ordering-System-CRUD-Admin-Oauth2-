<?php 
include('partials-front/menu.php'); 

use Detection\MobileDetect;

require __DIR__ . '/MobileDetect3.74/src/MobileDetect.php'; // Adjust the path as necessary


// Start session if not already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}


//echo json_encode(['csrf_token' => $_SESSION['csrf_token']]); //For testing postman or swagger

$user_ip = $_SERVER['REMOTE_ADDR'];


$ip_info = file_get_contents("http://ip-api.com/json/{$user_ip}");
$ip_details = json_decode($ip_info, true);

// Initialize MobileDetect
$detect = new MobileDetect;

// Get device type
$device_type = $detect->isMobile() ? 'Mobile' : ($detect->isTablet() ? 'Tablet' : 'Desktop');


$stmt = $conn->prepare("INSERT INTO user_data (ip_address, status, country, countryCode, region, regionName, city, zip, lat, lon, timezone, isp, org, as_info, device_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssssssssddsssss", 
    $ip_details['query'], 
    $ip_details['status'], 
    $ip_details['country'], 
    $ip_details['countryCode'], 
    $ip_details['region'], 
    $ip_details['regionName'], 
    $ip_details['city'], 
    $ip_details['zip'], 
    $ip_details['lat'], 
    $ip_details['lon'], 
    $ip_details['timezone'], 
    $ip_details['isp'], 
    $ip_details['org'], 
    $ip_details['as'], 
    $device_type
);

$logMessage = '';

if ($stmt->execute()) {
    $logMessage = "Data logged successfully.";
} else {
    $logMessage = "Error: " . $stmt->error;
}

$stmt->close();
?>

<!-- fOOD sEARCH Section Starts Here -->
<section class="food-search text-center">
    <div class="container">
        
        <form action="https://musaka.stud.vts.su.ac.rs/food-order/food-search.php" method="POST">
            <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
            <input type="search" name="search" placeholder="Search for Food.." required>
            <input type="submit" name="submit" value="Search" class="btn btn-primary">
        </form>

    </div>
</section>
<!-- fOOD sEARCH Section Ends Here -->


<?php 
if(isset($_SESSION['order']))
{
    echo $_SESSION['order'];
    unset($_SESSION['order']);
}
?>

<!-- CAtegories Section Starts Here -->
<section class="categories">
    <div class="container">
        <h2 class="text-center">Explore Foods</h2>

        <?php 
        //Create SQL Query to Display CAtegories from Database
        $sql = "SELECT * FROM tbl_category WHERE active='Yes' AND featured='Yes' LIMIT 3";
        //Execute the Query
        $res = mysqli_query($conn, $sql);
        //Count rows to check whether the category is available or not
        $count = mysqli_num_rows($res);

        if($count>0)
        {
            //CAtegories Available
            while($row=mysqli_fetch_assoc($res))
            {
                //Get the Values like id, title, image_name
                $id = $row['id'];
                $title = $row['title'];
                $image_name = $row['image_name'];
                ?>

                <a href="<?php echo SITEURL; ?>category-foods.php?category_id=<?php echo $id; ?>">
                    <div class="box-3 float-container">
                        <?php 
                        //Check whether Image is available or not
                        if($image_name=="")
                        {
                            //Display Message
                            echo "<div class='error'>Image not Available</div>";
                        }
                        else
                        {
                            //Image Available
                            ?>
                            <img src="<?php echo SITEURL; ?>images/category/<?php echo $image_name; ?>" alt="<?php echo $title; ?>" class="img-responsive img-curve">
                            <?php 
                        }
                        ?>
                        <h3 class="float-text text-white"><?php echo $title; ?></h3>
                    </div>
                </a>

                <?php
            }
        }
        else
        {
            //Categories not Available
            echo "<div class='error'>Category not Added.</div>";
        }
        ?>
        <div class="clearfix"></div>
    </div>
</section>
<!-- CAtegories Section Ends Here -->

<?php include('partials-front/footer.php'); ?>
