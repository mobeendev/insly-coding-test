<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Insly - Coding Challenge</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-home.css" rel="stylesheet">
  <script src="vendor/jquery/jquery.min.js"></script>


</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Car Tax Calculator</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <br>

   
    
    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-6">


        <h1 class="my-4">Insly's - Car Tax Calculator
          <small>Coding Challenge</small>
        </h1>

        <!-- Blog Post -->

        <!-- Blog Post -->
        <div class="mb-4">


          <form class=""  name="insly_form" action="process.php" method="POST">

            <div class="col-md-6 mb-3 custom-control">
              <label for="validationCustom01">Your Name</label>
              <input type="text" class="form-control" name="user_name" id="validationCustom01" placeholder="Enter name here" value="" required>
              <div class="valid-feedback">
                Looks good!
              </div>
            </div>



             <div class="col-md-6 mb-3 custom-control">
               <label for="validationCustom01"> Car Price
       <!--        <span for="validationCustom01" style="font-size: 12px;color: orange;">This is base price of the car</span>
        -->     </label>

              <input type="number" class="form-control" name="price_field" id="price_field" placeholder="Enter Price" value="" required>


              <div class="valid-feedback">
                Looks good!
              </div>
            </div>


            <div class="col-md-6 mb-3 custom-control">
               <label for="validationCustom01"> Tax Percentage (%) </label>
              <input type="number" class="form-control" name="tax_field" id="tax_field" value="0" required>
            </div>

             <div class="col-md-6 mb-3 custom-control">
               <label for="validationCustom01"> No of Installments</label>

                 <select class="custom-select" id="inputGroupSelect02" name="installments" required>
                    <option selected="selected" value="">--Select No of Installments--</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                    <option value="4">Four</option>
                    <option value="5">Five</option>
                    <option value="6">Six</option>
                  </select>
            </div>

            <input class="btn btn-primary" type="submit" value="Calculate">

          </form>

        </div>

        <!-- Blog Post -->



      </div>

      <div class="col-md-6">

        <div class="row">
                  <!-- <img class="card-img-top" src="car-shop.jpg" wid alt="Car Image"> -->

              <div class="col-md-12">
              <div class="mb-4">
                <?php if (isset($_SESSION['result'])): ?>
                  <div class="">
                    <?=$_SESSION['result']?>
                    <?=$_SESSION['table']?>
                  </div>
                <?php endif; session_destroy();?>
              </div>
        </div>
        </div>
        
      </div>

        <!-- Blog Entries Column -->
       

      <!-- Sidebar Widgets Column -->


    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
    </div>
    <!-- /.container -->
  </footer>
<script type="text/javascript">
  $(document).ready(function() {
  $('#tax_field').val('');

          $("#price_field").on("change paste keyup", function() {
              if ($(this).val()) {                
                    $('#tax_field').val(Math.floor(Math.random() * Math.floor(99)));
              }else{

              }
          });

  });

</script>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
