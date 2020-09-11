package News_Updates;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.Part;

import connections.DBConnection;

public class NewsDAO {

	public static int save(NewsBean n) {
		int status = 0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into newsupdates(Description,Date) values (?,CURRENT_TIMESTAMP)");

			ps.setString(1, n.getDescription());

			status = ps.executeUpdate();

			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static int update(NewsBean r) {
		int status = 0;

		try {
			Connection con = DBConnection.getConnection();

			String query = "update newsupdates set Description=?,Date=CURRENT_TIMESTAMP where NewsID=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(2, r.getDescription());
			ps.setString(3, r.getStatus());

			status = ps.executeUpdate();

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static NewsBean getNewsById() {
		NewsBean b = new NewsBean();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from newsupdates");

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				b.setId(rs.getInt(1));
				b.setDescription(rs.getString(2));
				b.setStatus(rs.getString(3));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}

	public static int saveImage(NewsBean n) {
		int status = 0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into news_images(image,Date) values (?,CURRENT_TIMESTAMP)");

			InputStream inputStream = null;

			Part filePart = n.getImage();

			inputStream = filePart.getInputStream();

			ps.setBlob(1, inputStream);

			status = ps.executeUpdate();

			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}
	
	public static NewsBean getNewsImage() {
		NewsBean b = new NewsBean();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from news_images");

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				b.setImageID(rs.getInt(1));
				b.setImages(rs.getBlob(2));
				b.setImageDate(rs.getString(3));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}
	

}
