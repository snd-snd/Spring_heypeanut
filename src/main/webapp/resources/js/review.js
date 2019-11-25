/** REVIEW SERVICE
 * 
 */
var reviewService = (function(){
		
	function getList(param, callback){
		var pno = param.pno;
		var page = param.page||1;
		
		$.getJSON({
			type : 'get',
			url : '/review/list?pno='+pno+'&page='+page,
			success : function(data){
				if(callback){
					callback(data.list, data.totalCount);
				}
			}
		});		
	}

	
	function displayTime(timeValue){
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		
		if (gap < (1000*60*60*24)){
			var HH = dateObj.getHours();
			var mm = dateObj.getMinutes();
			var ss = dateObj.getSeconds()
			
			return [(HH>9?'':'0')+HH,':',(mm>9?'':'0')+mm,':',(ss>9?'':'0')+ss].join('');
		} else{
			var yy = dateObj.getFullYear();
			var MM = dateObj.getMonth()+1;
			var dd = dateObj.getDate();
			
			return [ yy, '/', (MM>9?'':'0')+MM, '/', (dd>9?'':'0')+dd ].join('');
		}
	}
	
	return{ //클로저 패턴
		getList:getList,
		displayTime:displayTime
	};
	
})();
