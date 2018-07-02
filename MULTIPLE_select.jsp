<%@page contentType="text/html" pageEncoding="UTF-8"%>
       
<html>
      
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style1.css">

</head>     

<body>
    
      
        <%@ page  import="java.sql.DriverManager;"%>
        <%@ page  import="javax.swing.*"%>
        <%@ page  import=" java.sql.*"%>

        <h6 style="text-align: center;font-family:Courier New">FILL DETAILS</h6>

        <form action="" style="margin-left: 100px">        
        
<div style="padding-left:0px;padding-top:0px;width:200px;">

    <p>COURSE NAME</p>
    
   <%! ResultSet rs ;String name;%>    
       
     <%  
      try
      {
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       Connection con = (Connection)DriverManager.getConnection("jdbc:Mysql://localhost:3306/web1","root","");
       
       String str = "Select * from course";
       Statement stmt = con.createStatement();
      
       rs = stmt.executeQuery(str);
       
      }     
      catch(Exception e)
       {
          e.printStackTrace();
       }
    
     %>   
  

       <select name="course" onchange="this.form.submit()">
          
            <option value="0">COURSE</option>
          <%
             while(rs.next())
              {
          %>
          <option value= <%=rs.getInt("cid") %> 
              <%
                 if(request.getParameter("course")!=null)
                 {
                     if(rs.getInt("cid")==Integer.parseInt(request.getParameter("course")))
                     {
                         out.println("selected");
                     }
                 }
                 else
                 {
                     out.println("course");
                 }
              %>>
       
               <%
                 out.println(rs.getString("cname")) ;
              %>
          </option>   
          
        
          <%
              }
          %>  
          
          
          
        </select>  
     
</div>
        
        
          
<div style="padding-left:200px;padding-top:0px;width:200px;">
    <p>BATCH NAME</p>
  
    <select name="batch" onchange="this.form.submit()">
            
               <%! ResultSet r ;  String str,sdate,edate;int tid=0;%>    
       
     <%  
      try
      {
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       Connection con = (Connection)DriverManager.getConnection("jdbc:Mysql://localhost:3306/web1","root","");
       
        str="Select * from batch where cid = ?";
        
        PreparedStatement ps = con.prepareStatement(str);
        ps.setString(1,request.getParameter("course"));
        
        r=ps.executeQuery();
         
      }     
      catch(Exception e)
       {
          e.printStackTrace();
       }

     %>   
  
        <option value="0">batch</option>
          <%
             while(r.next())
              {
          %>
          <option value= <%=r.getInt("bid") %>
          
              <%
                 if(request.getParameter("batch")!=null)
                 {
                     if(r.getInt("bid")==Integer.parseInt(request.getParameter("batch")))
                     {
                         sdate=r.getString("sdate");
                         edate=r.getString("edate");
                         tid=r.getInt("tid");
                         out.println("selected");
                     }
                 }
                 else
                 {
                     out.println("batch");
                 }
              %>

              
          >
   

              <% 
                 out.println(r.getString("bname")) ;
              %>
          </option>   
          <%}%>

        
        </select>

</div>
          
          
<div style="padding-left:400px;padding-top:0px;width:200px;">
    <p>TEACHER NAME</p>
  
    <select name="tid">
          
     <%! ResultSet rt ;String tname;%>    
       
     <%  
      try
      {
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       Connection co = (Connection)DriverManager.getConnection("jdbc:Mysql://localhost:3306/web1","root","");
       
        str="Select * from faculty where TID = "+tid;
        
        Statement st = co.createStatement();
                
        rt=st.executeQuery(str);
         
      }     
      catch(Exception e)
       {
          e.printStackTrace();
       }

     %>   
  
          <%
             while(rt.next())
              {
          %>
          <option value="<%=tid%>"><%out.println(rt.getString("tname"));%></optioin>
          <% 
             }
          
           %>         
        </select>
    
</div>              
          <div style="padding-left:600px;padding-top:0px;width:200px;">
              <p>START DATE</p>
              <select>
                  <option><%=sdate%></option>
              </select>
           </div>
            
          <div style="padding-left:600px;padding-top:30px;width:200px;">    
              <p>END DATE</p>
               <select>
                  <option><%=edate%></option>
               </select>
               
          </div>    
</form>                   
<script type="text/javascript" src="script_1.js"></script>
<button class="w3-button w3-green" style="opacity:0.6;margin-left: 400px;" onclick="plusDivs(1, 0)">DONE</button>
<!--&#10095;-->
</body>
</html>
