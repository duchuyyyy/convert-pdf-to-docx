package model.dao;
 
import java.util.List;
import java.util.Optional;

import model.bean.*;
 
public interface FileDao {
	//upload file 
	void upload(String fileName, User user , int status);
	
	boolean isFileExist(String fileName);
	
	//convert file 
	List<fileUpload> getListConverterFile(User user);
	
	void changeStatus(int fileId, int fileStatus);
	
	//dowload file
	Optional<fileUpload> getFile(int fileId); 
}