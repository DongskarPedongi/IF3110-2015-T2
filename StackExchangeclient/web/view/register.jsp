<%-- 
    Document   : register
    Created on : Nov 16, 2015, 6:09:46 PM
    Author     : Luqman A. Siswanto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Register | Overflow48</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    <link rel="icon" type="image/png" href="../assets/white-icon.jpg">
    
  </head>
  <body>
    <div class="container">
      <h1 class="text-center"><a href="/StackExchangeclient">OVERFLOW48</a></h1>
      <form id="search" action="view/search.jsp" action="GET">
        <table>
        <tr>
          <td width="200%"> <input id="q" placeholder="What are you looking for?" type="text" class="form" name="q"></td>
          <td width="20%"> <button class="button" type="submit">Search</button> </td>
        </tr>
        </table>
      </form>
      <p class="text-right"><a href="login.jsp" class="link">Login</a> | <a href="register.jsp" class="link">Register</a></p>

      <br> <br>
        <div class="small_container">
          <form id="login" action="../controller/register.jsp" method="POST">
          <input id="name" placeholder="Name" class="form" type="text" name="name" value="">
          <input id="email" placeholder="Email" class="form" type="text" name="email" value="">
          <input id="pass" placeholder="Password" class="form" type="text" name="pass" value="">
          <div class="text-right">
              <button class="button" type="submit">Register</button>
          </div>
        </div>
      </form>
      
    </div>
    
  </body>
  <footer> <br><br> </footer>
</html>