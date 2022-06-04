<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Start Page</title>
    <style>
        .error {
            color: red
        }
    </style>
</head>
<body>
Your data has been submitted as follows:
<br>
<br>
Name: ${name}
Sectors: ${sectors}
<br>
<br>
Submit new data and click Edit if you want to change the data.
<br>
<br>
<form:form action="editData" method="POST" id="submitForm" modelAttribute="sectorForm">
    <label for="name">Name:</label>
    <form:input type="text" id="name" name="name" path="name"/>
    <form:errors path="name" cssClass="error"/>
    <br>
    <br>
    <label for="sectors">Sectors:</label>
    <form:select id="sectors" name="sectors" size="5" path="sectors">
        <form:option value="1">Manufacturing</form:option>
        <form:option value="19">&nbsp;&nbsp;&nbsp;&nbsp;Construction materials</form:option>
        <form:option value="18">&nbsp;&nbsp;&nbsp;&nbsp;Electronics and Optics</form:option>
        <form:option value="6">&nbsp;&nbsp;&nbsp;&nbsp;Food and Beverage</form:option>
        <form:option value="342">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bakery &amp; confectionery products</form:option>
        <form:option value="43">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Beverages</form:option>
        <form:option value="42">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fish &amp; fish products </form:option>
        <form:option value="40">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Meat &amp; meat products</form:option>
        <form:option value="39">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Milk &amp; dairy products </form:option>
        <form:option value="437">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other</form:option>
        <form:option value="378">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sweets &amp; snack food</form:option>
        <form:option value="13">&nbsp;&nbsp;&nbsp;&nbsp;Furniture</form:option>
        <form:option value="389">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bathroom/sauna </form:option>
        <form:option value="385">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bedroom</form:option>
        <form:option value="390">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Children’s room </form:option>
        <form:option value="98">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kitchen </form:option>
        <form:option value="101">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Living room </form:option>
        <form:option value="392">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Office</form:option>
        <form:option value="394">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other (Furniture)</form:option>
        <form:option value="341">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Outdoor </form:option>
        <form:option value="99">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Project furniture</form:option>
        <form:option value="12">&nbsp;&nbsp;&nbsp;&nbsp;Machinery</form:option>
        <form:option value="94">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Machinery components</form:option>
        <form:option value="91">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Machinery equipment/tools</form:option>
        <form:option value="224">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Manufacture of machinery </form:option>
        <form:option value="97">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Maritime</form:option>
        <form:option value="271">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Aluminium and steel workboats </form:option>
        <form:option value="269">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Boat/Yacht building</form:option>
        <form:option value="230">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ship repair and conversion</form:option>
        <form:option value="93">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Metal structures</form:option>
        <form:option value="508">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other</form:option>
        <form:option value="227">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Repair and maintenance service</form:option>
        <form:option value="11">&nbsp;&nbsp;&nbsp;&nbsp;Metalworking</form:option>
        <form:option value="67">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Construction of metal structures</form:option>
        <form:option value="263">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Houses and buildings</form:option>
        <form:option value="267">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Metal products</form:option>
        <form:option value="542">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Metal works</form:option>
        <form:option value="75">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CNC-machining</form:option>
        <form:option value="62">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Forgings, Fasteners </form:option>
        <form:option value="69">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gas, Plasma, Laser cutting</form:option>
        <form:option value="66">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MIG, TIG, Aluminum welding</form:option>
        <form:option value="9">&nbsp;&nbsp;&nbsp;&nbsp;Plastic and Rubber</form:option>
        <form:option value="54">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Packaging</form:option>
        <form:option value="556">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plastic goods</form:option>
        <form:option value="559">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plastic processing technology</form:option>
        <form:option value="55">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Blowing</form:option>
        <form:option value="57">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Moulding</form:option>
        <form:option value="53">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plastics welding and processing</form:option>
        <form:option value="560">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plastic profiles</form:option>
        <form:option value="5">&nbsp;&nbsp;&nbsp;&nbsp;Printing </form:option>
        <form:option value="148">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Advertising</form:option>
        <form:option value="150">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Book/Periodicals printing</form:option>
        <form:option value="145">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Labelling and packaging printing</form:option>
        <form:option value="7">&nbsp;&nbsp;&nbsp;&nbsp;Textile and Clothing</form:option>
        <form:option value="44">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Clothing</form:option>
        <form:option value="45">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Textile</form:option>
        <form:option value="8">&nbsp;&nbsp;&nbsp;&nbsp;Wood</form:option>
        <form:option value="337">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other (Wood)</form:option>
        <form:option value="51">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wooden building materials</form:option>
        <form:option value="47">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wooden houses</form:option>
        <form:option value="3">Other</form:option>
        <form:option value="37">&nbsp;&nbsp;&nbsp;&nbsp;Creative industries</form:option>
        <form:option value="29">&nbsp;&nbsp;&nbsp;&nbsp;Energy technology</form:option>
        <form:option value="33">&nbsp;&nbsp;&nbsp;&nbsp;Environment</form:option>
        <form:option value="2">Service</form:option>
        <form:option value="25">&nbsp;&nbsp;&nbsp;&nbsp;Business services</form:option>
        <form:option value="35">&nbsp;&nbsp;&nbsp;&nbsp;Engineering</form:option>
        <form:option value="28">&nbsp;&nbsp;&nbsp;&nbsp;Information Technology and Telecommunications</form:option>
        <form:option value="581">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Data processing, Web portals, E-marketing</form:option>
        <form:option value="576">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Programming, Consultancy</form:option>
        <form:option value="121">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Software, Hardware</form:option>
        <form:option value="122">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Telecommunications</form:option>
        <form:option value="22">&nbsp;&nbsp;&nbsp;&nbsp;Tourism</form:option>
        <form:option value="141">&nbsp;&nbsp;&nbsp;&nbsp;Translation services</form:option>
        <form:option value="21">&nbsp;&nbsp;&nbsp;&nbsp;Transport and Logistics</form:option>
        <form:option value="111">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Air</form:option>
        <form:option value="114">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rail</form:option>
        <form:option value="112">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Road</form:option>
        <form:option value="113">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Water</form:option>
    </form:select>
    <form:errors path="sectors" cssClass="error" />

    <br>
    <br>
    <form:checkbox id="terms" name="terms" value="accepted" path="acceptance"/>
    <label for="terms"> Agree to terms</label>
    <form:errors path="acceptance" cssClass="error" />

    <br>
    <br>
    <input type="submit" value="Edit" id = "submitButton">
</form:form>
</body>
</html>
