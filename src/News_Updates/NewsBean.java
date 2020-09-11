package News_Updates;

import java.sql.Blob;

import javax.servlet.http.Part;

public class NewsBean {

	protected int id;
	protected int ImageID;
	protected String Description;
	protected String Status;
	protected Part image;
	protected String ImageDate;
	protected Blob Images;
	
	public Blob getImages() {
		return Images;
	}

	public void setImages(Blob images) {
		Images = images;
	}

	public int getImageID() {
		return ImageID;
	}

	public void setImageID(int i) {
		ImageID = i;
	}

	public String getImageDate() {
		return ImageDate;
	}

	public void setImageDate(String imageDate) {
		ImageDate = imageDate;
	}

	public Part getImage() {
		return image;
	}

	public void setImage(Part image) {
		this.image = image;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
