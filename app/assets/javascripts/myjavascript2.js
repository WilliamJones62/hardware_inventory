function getData(data) {
  var p1 = data.replace('[', "");
  var p2 = p1.replace(']', "");
  p1 = p2.replace(/"/g, "");
  p2 = p1.replace(/,/g, "");
  var data_array = p2.split(" ");
  data_array.shift();
  data_array.pop();
  return data_array;
}

function setTruckSw() {
  var x = document.getElementById("DeviceType");
  var y = document.getElementById("TruckSw");
  var w = document.getElementById("LapDesk");
  var s = document.getElementById("LapTop");
  var t = document.getElementById("Printer");
  var u = document.getElementById("Phone");
  var v = document.getElementById("Tablet");
  var r = document.getElementById("TruckHeader");
  var device = x.value;
  y.style.display = "none";
  s.classList.remove("invisible");
  t.classList.remove("invisible");
  u.classList.remove("invisible");
  v.classList.remove("invisible");
  w.classList.remove("invisible");
  r.style.display = "none";
  if (device == "Tablet") {
    y.style.display = "inline";
    r.style.display = "inline";
    w.classList.add("invisible");
    s.classList.add("invisible");
    t.classList.add("invisible");
    u.classList.add("invisible");
  }
  if (device == "Laptop") {
    t.classList.add("invisible");
    u.classList.add("invisible");
    v.classList.add("invisible");
  }
  if (device == "Desktop") {
    s.classList.add("invisible");
    t.classList.add("invisible");
    u.classList.add("invisible");
    v.classList.add("invisible");
  }
  if (device == "Printer") {
    s.classList.add("invisible");
    w.classList.add("invisible");
    u.classList.add("invisible");
    v.classList.add("invisible");
  }
  if (device == "Phone") {
    s.classList.add("invisible");
    t.classList.add("invisible");
    w.classList.add("invisible");
  }
}

function setOwnerList() {
  var x = document.getElementById("TruckSw").checked;
  var y = document.getElementById("OwnerList");
  if (x == false) {
    var owners = document.getElementById("employees").innerHTML;
    var owners_array = getData(owners);
    var owner = document.getElementById("OwnerList");
    owner.options.length = 0;
    var o = document.createElement("option");
    o.selected = true;
    var arraylength = owners_array.length;
    for (i = 0; i < arraylength; i++) {
      text = owners_array[i].replace(/~/g, ' ');
      o.text = text.replace(/&amp;/g, '&');
      owner.options.add(o, owner.options.length);
      o.selected = false;
      o = document.createElement("option");
    }
  } else {
    var owners = document.getElementById("trucks").innerHTML;
    var owners_array = getData(owners);
    var owner = document.getElementById("OwnerList");
    owner.options.length = 0;
    var o = document.createElement("option");
    o.selected = true;
    var arraylength = owners_array.length;
    for (i = 0; i < arraylength; i++) {
      text = owners_array[i].replace(/~/g, ' ');
      o.text = text.replace(/&amp;/g, '&');
      owner.options.add(o, owner.options.length);
      o.selected = false;
      o = document.createElement("option");
    }
  }
}
