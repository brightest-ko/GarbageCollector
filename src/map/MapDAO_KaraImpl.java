package map;

import java.util.ArrayList;
import java.util.List;

public class MapDAO_KaraImpl implements MapDAO 
{
	private static List<MapVO> data = new ArrayList<MapVO>();
	private static int no = 0;
	

	@Override
	public List<MapVO> findAll() throws Exception {
		return data;
	}
}
