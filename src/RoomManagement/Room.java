package RoomManagement;

public class Room {
	 protected int id;
	 protected String RoomNo;
	    protected String roomName;
	    protected String RoomDesc;
	    protected int roomType;
	    protected int blockID;
	    protected String roomStatus;
	    
	public String getRoomStatus() {
			return roomStatus;
		}
		public void setRoomStatus(String roomStatus) {
			this.roomStatus = roomStatus;
		}
	public int getBlockID() {
			return blockID;
		}
		public void setBlockID(int blockID2) {
			this.blockID = blockID2;
		}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoomNo() {
		return RoomNo;
	}
	public void setRoomNo(String roomNo) {
		RoomNo = roomNo;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomDesc() {
		return RoomDesc;
	}
	public void setRoomDesc(String roomDesc) {
		RoomDesc = roomDesc;
	}
	public int getRoomType() {
		return roomType;
	}
	public void setRoomType(int i) {
		this.roomType = i;
	}
		
}
