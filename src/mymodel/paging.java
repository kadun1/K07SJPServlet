package mymodel;

public class paging {

	public static String pagingBS4(int totalCount, int pageSize, int blockPage, int nowPage, String pageName) {
		String pagingStr = "";
		
		int totalPage = (int)(Math.ceil(((double)totalCount/pageSize)));
		
		int initTemp = (((nowPage-1)/blockPage) * blockPage) + 1;
		
		int blockCount = 1;
		
		if(initTemp != 1) {
			pagingStr += "<li class='page-item'><a href='"+pageName+"nowPage=1' class='page-link'><i class='fas fa-angle-double-left'></i></a></li>";
			pagingStr += "<li class='page-item'><a href='"+pageName+"nowPage="+(initTemp-1)+"' class='page-link'><i class='fas fa-angle-left'></i></a></li>";
		}
		
		while(blockCount<=blockPage && initTemp<=totalPage) {
			if(initTemp==nowPage) 
				pagingStr += "<li class='page-item active'><a href='#' class='page-link'>"+initTemp+"</a></li>";
			else
				pagingStr += "<li class='page-item activ'><a href='"+pageName+"nowPage="+initTemp+"' class='page-link'>"+initTemp+"</a></li>";
			
			initTemp++;
			blockCount++;
			
		}
		if(initTemp<=totalPage) {
			pagingStr += "<li class='page-item'><a href='"+pageName+"nowPage="+(nowPage+1)+"' class='page-link'><i class='fas fa-angle-right'></i></a></li>";
			pagingStr += "<li class='page-item'><a href='"+pageName+"nowPage="+totalPage+"' class='page-link'><i class='fas fa-angle-double-right'></i></a></li>";
		}
		return pagingStr;
	}

}
