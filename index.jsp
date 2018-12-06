<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>

<%
//MySQL DataBase initialization
try{Class.forName("com.mysql.jdbc.Driver").newInstance();
}
catch(Exception e){
out.println("can't load mysql driver");
out.println(e.toString());
}

String url="jdbc:mysql://127.0.0.1:3306/Gallery";
String id="gallery";
String pwd="eecs118";
Connection con= DriverManager.getConnection(url,id,pwd);
%>

<%
//Variables used for input
String funcID = request.getParameter("funcID");

String artist_id = request.getParameter("artist_id");
String artist_name = request.getParameter("artist_name");
String artist_year = request.getParameter("artist_year");
String artist_country = request.getParameter("artist_country");
String artist_description = request.getParameter("artist_description");

String detail_id = request.getParameter("detail_id");
String detail_imageid = request.getParameter("detail_imageid");
String detail_year = request.getParameter("detail_year");
String detail_type = request.getParameter("detail_type");
String detail_width = request.getParameter("detail_width");
String detail_height = request.getParameter("detail_height");
String detail_location = request.getParameter("detail_location");
String detail_description = request.getParameter("detail_description");

String gallery_id = request.getParameter("gallery_id");
String gallery_name = request.getParameter("gallery_name");
String gallery_description = request.getParameter("gallery_description");

String image_id = request.getParameter("image_id");
String image_title = request.getParameter("image_title");
String image_link = request.getParameter("image_link");
String image_galleryid = request.getParameter("image_galleryid");
String image_artistid = request.getParameter("image_artistid");
String image_detailid = request.getParameter("image_detailid");

String img = request.getParameter("img");
String art = request.getParameter("art");
%>

<head><title>118 Gallery</title></head>
<h1>EECS 118 Gallery</h1>
<h2>Please select an option:</h2>
<h3>(Results will be displayed at the bottom of the page)</h3>

<b>List all galleries</b>
<form method ="post">
	<input name="funcID" type="hidden" value="1">
	<input type="submit" value="Go"/>
</form>

<b>List all images in a specific gallery</b>
<form method ="get">
	<input name="funcID" type="hidden" value="2">
		Gallery ID: <input name="gallery_id" type="test">
	<input type="submit" value="Go"/>
</form>

<b>List the details of a specific image</b>
<form method ="get">
	<input name="action" type="hidden" option value="16">
	<input name="funcID" type="hidden" value="16">
		Image ID: <input name="image_id" type="test">
	<input type="submit" value="Go"/>
</form>

<b>List the details of a specific artist</b>
<form method ="get">
	<input name="action" type="hidden" value="17">
	<input name="funcID" type="hidden" value="17">
		Artist ID: <input name="image_artistid" type="test">
	<input type="submit" value="Go"/>
</form>

<b>Add a new gallery</b>
<form method ="post">
	<input name="funcID" type="hidden" value="3">
		Gallery ID: <input name="gallery_id" type="test">
		Gallery Name: <input name="gallery_name" type="test">
		Gallery Description: <input name="gallery_description" type="test">
	<input type="submit" value="Go"/>
</form>

<b>Add a new artist</b>
<form method ="post">
	<input name="funcID" type="hidden" value="4">
		Artist ID: <input name="artist_id" type="test">
		Artist Name: <input name="artist_name" type="test">
		Artist Birth Year: <input name="artist_year" type="test">
		Artist Country: <input name="artist_country" type="test">
		Artist Description: <input name="artist_description" type="test">
	<input type="submit" value="Go"/>
</form>

<b>Add a new image to a specific gallery</b>
<form method ="post">
	<input name="funcID" type="hidden" value="5">
		Gallery ID: <input name="image_galleryid" type="test">
		Artist ID: <input name="image_artistid" type="test"><br>
		Image Title: <input name="image_title" type="test">
		Image Link: <input name="image_link" type="test">
		Image Year: <input name="detail_year" type="test">
		Image Type: <input name="detail_type" type="test"><br>
		Image Width: <input name="detail_width" type="test">
		Image Height: <input name="detail_height" type="test">
		Image Location: <input name="detail_location" type="test">
		Image Description: <input name="detail_description" type="test">
	<input type="submit" value="Go"/>
</form>

<b>Delete an image from a gallery</b>
<form method ="post">
	<input name="funcID" type="hidden" value="6">
		Image ID: <input name="image_galleryid" type="test">
	<input type="submit" value="Go"/>
</form>

<b>Modify the details of an image</b>
<form method ="post">
	<input name="funcID" type="hidden" value="7">
		Image to modify:<br>
		Image ID: <input name="image_id" type="test"><br>
		Edit details:<br>
		Image Title: <input name="image_title" type="test">
		Image Link: <input name="image_link" type="test">
		Image Year: <input name="detail_year" type="test">
		Image Type: <input name="detail_type" type="test"><br>
		Image Width: <input name="detail_width" type="test">
		Image Height: <input name="detail_height" type="test">
		Image Location: <input name="detail_location" type="test">
		Image Description: <input name="detail_description" type="test">
	<input type="submit" value="Go"/>
</form>

<b>Modify the details of an artist</b>
<form method ="post">
	<input name="funcID" type="hidden" value="8">
		Artist to modify:<br>
		Artist ID: <input name="artist_id" type="test"><br>
		Edit details:<br>
		Artist Name: <input name="artist_name" type="test">
		Artist Birth Year: <input name="artist_year" type="test">
		Artist Country: <input name="artist_country" type="test">
		Artist Description: <input name="artist_description" type="test">
	<input type="submit" value="Go"/>
</form>

<b>Modify the title and description of a gallery</b>
<form method ="post">
	<input name="funcID" type="hidden" value="9">
		Gallery to modify:<br>
		Gallery ID: <input name="gallery_id" type="test"><br>
		Edit details:<br>
		Gallery Name: <input name="gallery_name" type="test">
		Gallery Description: <input name="gallery_description" type="test">
	<input type="submit" value="Go"/>
</form>

<b>List all images by type</b>
<form method ="post">
	<input name="funcID" type="hidden" value="10">
		Type: <input name="detail_type" type="test">
	<input type="submit" value="Go"/>
</form>

<b>List all images by range of creation year</b>
<form method ="post">
	<input name="funcID" type="hidden" value="11">
		From Year <input name="image_title" type="test">
		to <input name="detail_year" type="test">
	<input type="submit" value="Go"/>
</form>

<b>List all images by artist name</b>
<form method ="post">
	<input name="funcID" type="hidden" value="12">
		Artist Name: <input name="artist_name" type="test">
	<input type="submit" value="Go"/>
</form>

<b>List all images by location</b>
<form method ="post">
	<input name="funcID" type="hidden" value="13">
		Location: <input name="detail_location" type="test">
	<input type="submit" value="Go"/>
</form>

<b>List all artists by country</b>
<form method ="post">
	<input name="funcID" type="hidden" value="14">
		Country: <input name="artist_country" type="test">
	<input type="submit" value="Go"/>
</form>

<b>List all artists by birth year</b>
<form method ="post">
	<input name="funcID" type="hidden" value="15">
		Birth Year: <input name="artist_year" type="test">
	<input type="submit" value="Go"/>
</form>

<%
	Statement stmt = null;
	PreparedStatement pstmt = null;
	String sql = null;
	ResultSet rs = null;
	int options = 0;
	String itempID = null;
	String dtempID = null;
	
	
	try{
		options = Integer.parseInt(funcID);
	}
	catch(Exception e){}
	
	switch(options){
		
		//Option 1: List all galleries
		case 1:
			stmt = con.createStatement();
			sql = "SELECT * from gallery";
			rs = stmt.executeQuery(sql);
			
			out.println("<table border=\"1\">");
			out.println("<caption> Gallery List </caption>");
			out.println("<tr>");
			out.println("<th>Gallery ID</th>");
			out.println("<th>Name</th>");
			out.println("<th>Description</th>");
			out.println("</tr>");
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>" + rs.getString("gallery_id") + "</td>");
				out.println("<td>" + rs.getString("name") + "</td>");
				out.println("<td>" + rs.getString("description") + "</td>");
				out.println("</tr>");}
			out.println("</table>");
			break;
			
		//Option 2: List all images in a specific gallery
		//In order to visit other functions after selecting this one, the url must be reset to index.jsp (default)
		case 2:
			stmt = con.createStatement();
			sql = "SELECT Count(*) x from image where gallery_id = '" + gallery_id+"'";
			rs = stmt.executeQuery(sql);
			rs.next();
			out.println("<p>Number of images in gallery: " +rs.getString(1)+"</p>");
			stmt = con.createStatement();
			sql = "SELECT image_id,title,link from image where gallery_id = '" + gallery_id+"'";
			rs = stmt.executeQuery(sql);
			out.println("<table border=\"1\">");
			out.println("<caption> Image List </caption>");

			out.println("<tr>");
			out.println("<th>Title</th>");
			out.println("<th>Link</th>");
			out.println("<th>Additional Info</th>");
			out.println("</tr>");
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>" + rs.getString("title") + "</td>");
				out.println("<td>" + rs.getString("link") + "</td>");
				out.println("<td>");
				out.println("<a href=\"index.jsp?action=16&funcID=16&image_id="+rs.getString("image_id")+"\">Info</a>");
				out.println("</td>");
				out.println("</tr>");}
			out.println("</table>");
			break;		
		
		//Option 3: Add a new gallery
		case 3:
			pstmt = con.prepareStatement("insert into gallery values(?,?,?)",Statement.RETURN_GENERATED_KEYS);
			pstmt.clearParameters();
			pstmt.setString(1, gallery_id);
			pstmt.setString(2, gallery_name);
			pstmt.setString(3, gallery_description);
			pstmt.executeUpdate();
			rs=pstmt.getGeneratedKeys();
			while (rs.next()) {
				out.println("Successfully added gallery_ID:"+rs.getInt(1));}
			break;
		
		//Option 4: Add a new artist
		case 4:
			pstmt = con.prepareStatement("insert into artist values(?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
			pstmt.clearParameters();
			pstmt.setString(1, artist_id);
			pstmt.setString(2, artist_name);
			pstmt.setString(3, artist_year);
			pstmt.setString(4, artist_country);
			pstmt.setString(5, artist_description);
			pstmt.executeUpdate();
			rs=pstmt.getGeneratedKeys();
			while (rs.next()) {
				out.println("Successfully added artist_ID:"+rs.getInt(1));}
			break;
		
		//Option 5: Add a new image to a gallery
		case 5:
			pstmt = con.prepareStatement("insert into image values(Default,?,?,?,?,null)",Statement.RETURN_GENERATED_KEYS);
			pstmt.clearParameters();
			pstmt.setString(1, image_title);
			pstmt.setString(2, image_link);
			pstmt.setString(3, image_galleryid);
			pstmt.setString(4, image_artistid);
			pstmt.executeUpdate();
			rs=pstmt.getGeneratedKeys();
			while (rs.next()) {
				out.println("Successfully added image_ID:"+rs.getInt(1));
				itempID = rs.getString(1);}
				
			pstmt = con.prepareStatement("insert into detail values(Default,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
			pstmt.clearParameters();
			pstmt.setString(1, itempID);
			pstmt.setString(2, detail_year);
			pstmt.setString(3, detail_type);
			pstmt.setString(4, detail_width);
			pstmt.setString(5, detail_height);
			pstmt.setString(6, detail_location);
			pstmt.setString(7, detail_description);
			pstmt.executeUpdate();
			rs=pstmt.getGeneratedKeys();
			while (rs.next()) {
				dtempID = rs.getString(1);}
			
			pstmt = con.prepareStatement("Update image set detail_id = '"+dtempID+"' where image_id = '" +itempID+"'");
			pstmt.clearParameters();
			pstmt.executeUpdate();
			out.println("Image Added.");
			break;
			
		//Option 6: Delete an image from a gallery
		case 6:
			try{
				stmt = con.createStatement();
				sql = "select detail_id from image where image_id = " +image_id;
				rs = stmt.executeQuery(sql);
				if (!rs.next()){
					out.println("Image does not exist.");
					break;}
				detail_id = rs.getString(1);
				pstmt = con.prepareStatement("Delete from image " + "Where image_id = ?");
				pstmt.clearParameters();
				pstmt.setString(1, image_id);
				pstmt.executeUpdate();
				pstmt = con.prepareStatement("Delete from detail " + "Where detail_id = ?");
				pstmt.clearParameters();
				pstmt.setString(1, detail_id);
				pstmt.executeUpdate();
				out.println("Image Deleted.");}
			catch(Exception e){
				out.println("Error occurred when deleting image.");
				out.println(e);}
			break;

		//Option 7: Edit the details of an Image
		case 7:
			pstmt = con.prepareStatement("Update image set title = '"+image_title+"', link = '"+image_link+"' where image_id = '" +image_id+"'");
			pstmt.clearParameters();
			pstmt.executeUpdate();
			pstmt = con.prepareStatement("Update detail set year = '"+detail_year+"', type = '"+detail_type+"', width = '"+detail_width+"', height = '"+detail_height+"', location = '"+detail_location+"', description = '"+detail_description+"' where image_id = '" +image_id+"'");
			pstmt.clearParameters();
			pstmt.executeUpdate();
			out.println("Successfully modified image.");
			break;
			
		//Option 8: Edit the details of an Artist
		case 8:
			pstmt = con.prepareStatement("Delete from artist " + "Where artist_id = '" +artist_id +"'");
			pstmt.clearParameters();
			pstmt.executeUpdate();
			pstmt = con.prepareStatement("insert into artist values(?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
			pstmt.clearParameters();
			pstmt.setString(1, artist_id);
			pstmt.setString(2, artist_name);
			pstmt.setString(3, artist_year);
			pstmt.setString(4, artist_country);
			pstmt.setString(5, artist_description);
			pstmt.executeUpdate();
			rs=pstmt.getGeneratedKeys();
			while (rs.next()) {
				out.println("Successfully modified artist_ID:"+rs.getInt(1));}
			break;
			
		//Option 9: Edit the title and description of a gallery
		case 9:
			pstmt = con.prepareStatement("Delete from gallery " + "Where gallery_id = '" +gallery_id +"'");
			pstmt.clearParameters();
			pstmt.executeUpdate();
			pstmt = con.prepareStatement("insert into gallery values(?,?,?)",Statement.RETURN_GENERATED_KEYS);
			pstmt.clearParameters();
			pstmt.setString(1, gallery_id);
			pstmt.setString(2, gallery_name);
			pstmt.setString(3, gallery_description);
			pstmt.executeUpdate();
			rs=pstmt.getGeneratedKeys();
			while (rs.next()) {
				out.println("Successfully modified gallery_ID:"+rs.getInt(1));}
			break;
			
			
		//Option 10: Find the images by type
		case 10:
			stmt = con.createStatement();
			sql = "SELECT i.image_id,i.artist_id,title,link from image i,detail d where i.image_id= d.image_id and type = '" + detail_type+"'";
			rs = stmt.executeQuery(sql);
			
			out.println("<table border=\"1\">");
			out.println("<caption> Image List </caption>");
			out.println("<tr>");
			out.println("<th>Image ID</th>");
			out.println("<th>Artist ID</th>");
			out.println("<th>Title</th>");
			out.println("<th>Link</th>");
			out.println("</tr>");
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>" + rs.getString("i.image_id") + "</td>");
				out.println("<td>" + rs.getString("i.artist_id") + "</td>");
				out.println("<td>" + rs.getString("title") + "</td>");
				out.println("<td>" + rs.getString("link") + "</td>");
				out.println("</tr>");}
			out.println("</table>");
			break;
		
			
		//Option 11: Find the images by range of creation year
		case 11:
			stmt = con.createStatement();
			sql = "SELECT i.image_id,i.artist_id,title,link from image i,detail d where i.image_id= d.image_id and d.year >= '" + image_title +"' and d.year <= '"+ detail_year+"'" ;
			rs = stmt.executeQuery(sql);
			
			out.println("<table border=\"1\">");
			out.println("<caption> Image List </caption>");
			out.println("<tr>");
			out.println("<th>Image ID</th>");
			out.println("<th>Artist ID</th>");
			out.println("<th>Title</th>");
			out.println("<th>Link</th>");
			out.println("</tr>");
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>" + rs.getString("i.image_id") + "</td>");
				out.println("<td>" + rs.getString("i.artist_id") + "</td>");
				out.println("<td>" + rs.getString("title") + "</td>");
				out.println("<td>" + rs.getString("link") + "</td>");
				out.println("</tr>");}
			out.println("</table>");
			break;
			
		//Option 12: Find the images by artist name
		case 12:
			stmt = con.createStatement();
			sql = "SELECT i.image_id,i.artist_id,title,link from image i,detail d,artist a where a.artist_id = i.artist_id and i.image_id= d.image_id and a.name = '" + artist_name+"'";
			rs = stmt.executeQuery(sql);
			
			out.println("<table border=\"1\">");
			out.println("<caption> Image List </caption>");
			out.println("<tr>");
			out.println("<th>Image ID</th>");
			out.println("<th>Artist ID</th>");
			out.println("<th>Title</th>");
			out.println("<th>Link</th>");
			out.println("</tr>");
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>" + rs.getString("i.image_id") + "</td>");
				out.println("<td>" + rs.getString("i.artist_id") + "</td>");
				out.println("<td>" + rs.getString("title") + "</td>");
				out.println("<td>" + rs.getString("link") + "</td>");
				out.println("</tr>");}
			out.println("</table>");
			break;			

		//Option 13: Find the images by location
		case 13:
			stmt = con.createStatement();
			sql = "SELECT i.image_id,i.artist_id,title,link from image i,detail d where i.image_id= d.image_id and d.location = '" + detail_location+"'";
			rs = stmt.executeQuery(sql);
			
			out.println("<table border=\"1\">");
			out.println("<caption> Image List </caption>");
			out.println("<tr>");
			out.println("<th>Image ID</th>");
			out.println("<th>Artist ID</th>");
			out.println("<th>Title</th>");
			out.println("<th>Link</th>");
			out.println("</tr>");
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>" + rs.getString("i.image_id") + "</td>");
				out.println("<td>" + rs.getString("i.artist_id") + "</td>");
				out.println("<td>" + rs.getString("title") + "</td>");
				out.println("<td>" + rs.getString("link") + "</td>");
				out.println("</tr>");}
			out.println("</table>");
			break;

		//Option 14: Find the artists by country
		case 14:
			stmt = con.createStatement();
			sql = "SELECT * from artist a where a.country = '" + artist_country+"'";
			rs = stmt.executeQuery(sql);
			
			out.println("<table border=\"1\">");
			out.println("<caption> Artists: </caption>");
			out.println("<tr>");
			out.println("<th>Artist ID</th>");
			out.println("<th>Name</th>");
			out.println("<th>Birth Year</th>");
			out.println("<th>Country</th>");
			out.println("<th>Description</th>");
			out.println("</tr>");
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>" + rs.getString("a.artist_id") + "</td>");
				out.println("<td>" + rs.getString("a.name") + "</td>");
				out.println("<td>" + rs.getString("a.birth_year") + "</td>");
				out.println("<td>" + rs.getString("country") + "</td>");
				out.println("<td>" + rs.getString("description") + "</td>");
				out.println("</tr>");}
			out.println("</table>");
			break;

		//Option 15: Find the artists by Birth Year
		case 15:
			stmt = con.createStatement();
			sql = "SELECT * from artist a where a.birth_year = '" + artist_year+"'";
			rs = stmt.executeQuery(sql);
			
			out.println("<table border=\"1\">");
			out.println("<caption> Artists: </caption>");
			out.println("<tr>");
			out.println("<th>Artist ID</th>");
			out.println("<th>Name</th>");
			out.println("<th>Birth Year</th>");
			out.println("<th>Country</th>");
			out.println("<th>Description</th>");
			out.println("</tr>");
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>" + rs.getString("a.artist_id") + "</td>");
				out.println("<td>" + rs.getString("a.name") + "</td>");
				out.println("<td>" + rs.getString("a.birth_year") + "</td>");
				out.println("<td>" + rs.getString("country") + "</td>");
				out.println("<td>" + rs.getString("description") + "</td>");
				out.println("</tr>");}
			out.println("</table>");
			break;
		
		//Option 16: Show details of specific image
		//In order to visit other functions after selecting this one, the url must be reset to index.jsp (default)
		case 16:
			stmt = con.createStatement();
			sql = "SELECT i.title,i.artist_id,a.name,d.year,d.type,d.width,d.height,d.location,d.description from image i,detail d, artist a where a.artist_id = i.artist_id and i.image_id= d.image_id and i.image_id ='"+image_id+"'";
			rs = stmt.executeQuery(sql);
			
			out.println("<table border=\"1\">");
			out.println("<caption> Image Details </caption>");
			out.println("<tr>");
			out.println("<th>Title</th>");
			out.println("<th>Artist Name</th>");
			out.println("<th>Artist ID</th>");
			out.println("<th>Artist Info</th>");
			out.println("<th>Year</th>");
			out.println("<th>Type</th>");
			out.println("<th>Width</th>");
			out.println("<th>Height</th>");
			out.println("<th>Location</th>");
			out.println("<th>Description</th>");
			out.println("</tr>");
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>" + rs.getString("i.title") + "</td>");
				out.println("<td>" + rs.getString("a.name") + "</td>");
				out.println("<td>" + rs.getString("i.artist_id") + "</td>");
				out.println("<td>");
				out.println("<a href=\"index.jsp?action=17&funcID=17&image_artistid="+rs.getString("i.artist_id")+"\">Artist Info</a>");
				out.println("</td>");
				out.println("<td>" + rs.getString("d.year") + "</td>");
				out.println("<td>" + rs.getString("d.type") + "</td>");
				out.println("<td>" + rs.getString("d.width") + "</td>");
				out.println("<td>" + rs.getString("d.height") + "</td>");
				out.println("<td>" + rs.getString("d.location") + "</td>");
				out.println("<td>" + rs.getString("d.description") + "</td>");
				out.println("</tr>");}
			out.println("</table>");
			break;
		
		//Option 17: Show details of specific artist
		//In order to visit other functions after selecting this one, the url must be reset to index.jsp (default)
		case 17:
			stmt = con.createStatement();
			sql = "SELECT * from artist a where a.artist_id = '" + image_artistid+"'";
			rs = stmt.executeQuery(sql);
			
			out.println("<table border=\"1\">");
			out.println("<caption> Artist Info: </caption>");
			out.println("<tr>");
			out.println("<th>Artist ID</th>");
			out.println("<th>Name</th>");
			out.println("<th>Birth Year</th>");
			out.println("<th>Country</th>");
			out.println("<th>Description</th>");
			out.println("</tr>");
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>" + rs.getString("a.artist_id") + "</td>");
				out.println("<td>" + rs.getString("a.name") + "</td>");
				out.println("<td>" + rs.getString("a.birth_year") + "</td>");
				out.println("<td>" + rs.getString("country") + "</td>");
				out.println("<td>" + rs.getString("description") + "</td>");
				out.println("</tr>");}
			out.println("</table>");
			break;
		
			}
%>
