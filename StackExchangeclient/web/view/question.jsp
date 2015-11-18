<%-- 
    Document   : question
    Created on : Nov 16, 2015, 6:09:23 PM
    Author     : Luqman A. Siswanto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Question | Overflow48</title>
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
      
      <%
        QuestionWS.QuestionWS_Service qservice = new QuestionWS.QuestionWS_Service();
        QuestionWS.QuestionWS qport = qservice.getQuestionWSPort();
        AnswerWS.AnswerWS_Service aservice = new AnswerWS.AnswerWS_Service();
        AnswerWS.AnswerWS aport = aservice.getAnswerWSPort();
        
        int id = Integer.parseInt(request.getParameter("id"));
        QuestionWS.Question q = qport.getQuestionByQID(id).get(0);
        java.util.List<AnswerWS.Answer> answers = aport.getAnswerByQID(id);
      %>      

      <h2><a href="question.jsp?id=<%=id%>"><%=q.getTopic()%></a></h2>

      <div class="question">
        <hr class="line">
        <div class="item">
          <div class="vote">
            <table width="100%" class="text-center">
              <tr><td><div class="arrow"><a href="../controller/upvoteQuestion.jsp?id=<%=id%>">&#9650;</a></div></td></tr>
              <tr><td><div class="votes" id="voteQuestion"><%=q.getVote()%></div></td></tr>
              <tr><td><div class="arrow"><a href="../controller/downvoteQuestion.jsp?id=<%=id%>">&#9660;</a></div></td></tr>
            </table>
          </div>
          <div class="text-long">
            <p><%=q.getContent()%></p>
          </div>
          <div class="text-right">
            <p>asked by <%=q.getName()%> at <%=q.getDate()%> | <a href="ask.jsp?id=<%=id%>" class="link">edit</a> | <a href="../controller/delete.jsp?id=<%=id%>" class="link">delete</a></p>
          </div>
        </div>
      </div>

      <br/> <h2><%=q.getSumAns()%> Answers</h2>

      <% for(AnswerWS.Answer a : answers) { %>
      <div class="question">
        <hr class="line">
        <div class="item">
          <div class="vote">
            <table width="100%" class="text-center">
              <tr><td><div class="arrow"><a href="../controller/upvoteAnswer.jsp?id=<%=a.getId()%>">&#9650;</a></div></td></tr>
              <tr><td><div class="votes" id="voteQuestion"><%=a.getVote()%></div></td></tr>
              <tr><td><div class="arrow"><a href="../controller/downvoteAnswer.jsp?id=<%=a.getId()%>">&#9660;</a></div></td></tr>
            </table>
          </div>
          <div class="text-long">
            <p><%=a.getContent()%></p>
          </div>
          <div class="text-right">
            <p>answered by <%=a.getName()%> at <%=a.getDate()%></p>
          </div>
        </div>
      </div>
      <% } %>

      <br/><h3>Your Answer</h3>

      <form id="answer" action="../controller/answer.jsp" method="POST">
        <input name="id" type="hidden" value=<%=id%>>
        <textarea id="content" placeholder="Content" class="box" name="content" rows="5"></textarea>
        <div class="text-right">
            <button class="button" class="text-right" type="submit">Post</button>
        </div>
      </form>
    </div>
        
  </body>
  <footer> <br><br> </footer>
</html>