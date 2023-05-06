<p id="fileContents";"></p>

<script>
async function onlyTheBestFunctionNames()
{
  let response = await fetch("diary.txt", {cache: "no-store"});
  let contents = await response.text();
  document.getElementById("fileContents").innerHTML = contents;
}
onlyTheBestFunctionNames();
</script>
