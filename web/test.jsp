<%-- 
    Document   : test
    Created on : Sep 25, 2023, 9:20:26 AM
    Author     : dogon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <form action="addtocart" method="post">
  <label for="productId">Product ID:</label><br>
  <input type="text" id="productId" name="id"><br>
  <label for="size">Size:</label><br>
  <input type="text" id="size" name="size"><br>
  <label for="quantity">Quantity:</label><br>
  <input type="number" id="quantity" name="quantity"><br>
  <input type="submit" value="Submit">
  </form>
    </body>
</html>
