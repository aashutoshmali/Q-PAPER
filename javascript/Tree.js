
function treeViewCheck()
 { 
// obj gives us the node on which check or uncheck operation has performed 

var obj = window.event.srcElement; 

var treeNodeFound = false; 

var checkedState; 

//checking whether obj consists of checkbox or not 

if (obj.tagName == "INPUT" && obj.type == "checkbox") {

//easier to read

var treeNode = obj; 

//record the checked state of the TreeNode 

checkedState = treeNode.checked; 

//work our way back to the parent <table> element 

do {

obj = obj.parentElement; 

} while (obj.tagName != "TABLE") 

//keep track of the padding level for comparison with any children 

var parentTreeLevel = obj.rows[0].cells.length; 

var parentTreeNode = obj.rows[0].cells[0]; 

//get all the TreeNodes inside the TreeView (the parent <div>) 

var tables = obj.parentElement.getElementsByTagName("TABLE"); 

//checking for any node is checked or unchecked during operation 

if(obj.tagName == "TABLE") {


// if any node is unchecked then their parent node are unchecked 

if (!treeNode.checked) {

//head1 gets the parent node of the unchecked node 

var head1 = obj.parentElement.previousSibling; 

if(head1.tagName == "TABLE") {

//checks for the input tag which consists of checkbox 

var matchElement1 = head1.getElementsByTagName("INPUT"); 

//matchElement1[0] gives us the checkbox and it is unchecked 

matchElement1[0].checked = false; 

}

else {

head1 = obj.parentElement.previousSibling;

} 

if(head1.tagName == "TABLE") {

//head2 gets the parent node of the unchecked node 

var head2 = obj.parentElement.parentElement.previousSibling; 

if(head2.tagName == "TABLE") {

//checks for the input tag which consists of checkbox 

var matchElement2 = head2.getElementsByTagName("INPUT"); 

matchElement2[0].checked = false; 

}

}

else {

head2 = obj.parentElement.previousSibling;

} 

if(head2.tagName == "TABLE") {

//head3 gets the parent node of the unchecked node 

var head3 = obj.parentElement.parentElement.parentElement.previousSibling; 

if(head3.tagName == "TABLE") {

//checks for the input tag which consists of checkbox 

var matchElement3 = head3.getElementsByTagName("INPUT"); 

matchElement3[0].checked = false; 

}

}

else {

head3 = obj.parentElement.previousSibling;

} 

if(head3.tagName == "TABLE") { 

//head4 gets the parent node of the unchecked node 

var head4 = obj.parentElement.parentElement.parentElement.parentElement.previousSibling; 

if(head4 != null) { 

if(head4.tagName == "TABLE") { 

//checks for the input tag which consists of checkbox 

var matchElement4 = head4.getElementsByTagName("INPUT"); 

matchElement4[0].checked = false; 

}

}

} 

} //end if - unchecked

//total number of TreeNodes 

var numTables = tables.length 

if (numTables >= 1) {

//cycle through all the TreeNodes 

//until we find the TreeNode we checked 

for (i=0; i < numTables; i++) {

if (tables[i] == obj) {

treeNodeFound = true; 

i++;

if (i == numTables) {

//if we're on the last 

//TreeNode then stop 

//return;

break;

}

} 

if (treeNodeFound == true) {

var childTreeLevel = tables[i].rows[0].cells.length; 

//if the current node is under the parent 

//the level will be deeper (greater) 

if (childTreeLevel > parentTreeLevel) { 

//jump to the last cell... it contains the checkbox 

var cell = tables[i].rows[0].cells[childTreeLevel - 1]; 

//set the checkbox to match the checkedState 

//of the TreeNode that was clicked 

var inputs = cell.getElementsByTagName("INPUT"); 

inputs[0].checked = checkedState; 

} 

else { 

//if any of the preceding TreeNodes are not deeper stop 

//return; 

break;

}

} //end if 

}//end for 

} //end if - numTables >= 1

// if all child nodes are checked then their parent node is checked

if (treeNode.checked) {

var chk1 = true;

var head1 = obj.parentElement.previousSibling;

var pTreeLevel1 = obj.rows[0].cells.length;

if(head1.tagName == "TABLE") {

var tbls = obj.parentElement.getElementsByTagName("TABLE");

var tblsCount = tbls.length;

for (i=0; i < tblsCount; i++) {

var childTreeLevel = tbls[i].rows[0].cells.length;

if (childTreeLevel = pTreeLevel1) {

var chld = tbls[i].getElementsByTagName("INPUT");

if (chld[0].checked == false) {

chk1 = false;

break;

}

}

}

var nd = head1.getElementsByTagName("INPUT");

nd[0].checked = chk1;

}

else {

head1 = obj.parentElement.previousSibling;

}

var chk2 = true;

if(head1.tagName == "TABLE") {

var head2 = obj.parentElement.parentElement.previousSibling; 

if(head2.tagName == "TABLE") {

var tbls = head1.parentElement.getElementsByTagName("TABLE");

var pTreeLevel2 = head1.rows[0].cells.length;

var tblsCount = tbls.length;

for (i=0; i < tblsCount; i++) {

var childTreeLevel = tbls[i].rows[0].cells.length;

if (childTreeLevel = pTreeLevel2) {

var chld = tbls[i].getElementsByTagName("INPUT");

if (chld[0].checked == false) {

chk2 = false;

break;

}

}

}

var nd = head2.getElementsByTagName("INPUT");

nd[0].checked = (chk2 && chk1);

}

}

else {

head2 = obj.parentElement.previousSibling;

}

var chk3 = true;

if(head2.tagName == "TABLE") {

var head3 = obj.parentElement.parentElement.parentElement.previousSibling; 

if(head3.tagName == "TABLE") {

var tbls = head2.parentElement.getElementsByTagName("TABLE");

var pTreeLevel3 = head2.rows[0].cells.length;

var tblsCount = tbls.length;

for (i=0; i < tblsCount; i++) {

var childTreeLevel = tbls[i].rows[0].cells.length;

if (childTreeLevel = pTreeLevel3) {

var chld = tbls[i].getElementsByTagName("INPUT");

if (chld[0].checked == false) {

chk3 = false;

break;

}

}

}

var nd = head3.getElementsByTagName("INPUT");

nd[0].checked = (chk3 && chk2 && chk1);

}

}

else {

head3 = obj.parentElement.previousSibling;

}

var chk4 = true;

if(head3.tagName == "TABLE") {

var head4 = obj.parentElement.parentElement.parentElement.parentElement.previousSibling; 

if(head4.tagName == "TABLE") {

var tbls = head3.parentElement.getElementsByTagName("TABLE");

var pTreeLevel4 = head3.rows[0].cells.length;

var tblsCount = tbls.length;

for (i=0; i < tblsCount; i++) {

var childTreeLevel = tbls[i].rows[0].cells.length;

if (childTreeLevel = pTreeLevel4) {

var chld = tbls[i].getElementsByTagName("INPUT");

if (chld[0].checked == false) {

chk4 = false;

break;

}

}

}

var nd = head4.getElementsByTagName("INPUT");

nd[0].checked = (chk4 && chk3 && chk2 && chk1);

}

}

}//end if - checked

} //end if - tagName = TABLE

} //end if

} //end function
 


