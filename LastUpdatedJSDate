<p id="lastUpdatedDate";"></p>

<script>
function fetchHeader(url, wch) {
    try {
        var req=new XMLHttpRequest();
        req.open("HEAD", url, false);
        req.send(null);
        if(req.status== 200){
            return req.getResponseHeader(wch);
        }
        else return false;
    } catch(er) {
        return er.message;
    }
}
var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];
var fetchedDate = fetchHeader('diary.txt','Last-Modified');
var parsedDate = Date.parse(fetchedDate);
var convertedDate = new Date(parsedDate);
var formattedDate = monthNames[convertedDate.getMonth()] + ' ' + convertedDate.getDate() + ', ' + convertedDate.getFullYear();
document.getElementById("lastUpdatedDate").innerHTML = formattedDate;
</script>
