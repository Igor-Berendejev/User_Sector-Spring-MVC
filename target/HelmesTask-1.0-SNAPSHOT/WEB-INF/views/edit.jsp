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
Your data has been submitted.
<br>
Submit new data and click Edit if you want to change the data.
<br>
<br>
<form:form action="editData" method="POST" id="submitForm" modelAttribute="sectorForm">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="${name}"/>
    <form:errors path="name" cssClass="error"/>
    <br>
    <br>
    <label for="sectors">Sectors:</label>
    <select id="sectors" name="sectors" size="5" multiple>
        <option value="1" ${selectedCat1}>Manufacturing</option>
        <option value="19" ${selectedCat19}>&nbsp;&nbsp;&nbsp;&nbsp;Construction materials</option>
        <option value="18" ${selectedCat18}>&nbsp;&nbsp;&nbsp;&nbsp;Electronics and Optics</option>
        <option value="6" ${selectedCat6}>&nbsp;&nbsp;&nbsp;&nbsp;Food and Beverage</option>
        <option value="342" ${selectedCat342}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bakery &amp; confectionery products</option>
        <option value="43" ${selectedCat43}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Beverages</option>
        <option value="42" ${selectedCat42}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fish &amp; fish products </option>
        <option value="40" ${selectedCat40}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Meat &amp; meat products</option>
        <option value="39" ${selectedCat39}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Milk &amp; dairy products </option>
        <option value="437" ${selectedCat437}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other</option>
        <option value="378" ${selectedCat378}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sweets &amp; snack food</option>
        <option value="13" ${selectedCat13}>&nbsp;&nbsp;&nbsp;&nbsp;Furniture</option>
        <option value="389" ${selectedCat389}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bathroom/sauna </option>
        <option value="385" ${selectedCat385}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bedroom</option>
        <option value="390" ${selectedCat390}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Children’s room </option>
        <option value="98" ${selectedCat98}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kitchen </option>
        <option value="101" ${selectedCat101}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Living room </option>
        <option value="392" ${selectedCat392}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Office</option>
        <option value="394" ${selectedCat394}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other (Furniture)</option>
        <option value="341" ${selectedCat341}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Outdoor </option>
        <option value="99" ${selectedCat99}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Project furniture</option>
        <option value="12" ${selectedCat12}>&nbsp;&nbsp;&nbsp;&nbsp;Machinery</option>
        <option value="94" ${selectedCat94}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Machinery components</option>
        <option value="91" ${selectedCat91}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Machinery equipment/tools</option>
        <option value="224" ${selectedCat224}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Manufacture of machinery </option>
        <option value="97" ${selectedCat97}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Maritime</option>
        <option value="271" ${selectedCat271}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Aluminium and steel workboats </option>
        <option value="269" ${selectedCat269}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Boat/Yacht building</option>
        <option value="230" ${selectedCat230}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ship repair and conversion</option>
        <option value="93" ${selectedCat93}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Metal structures</option>
        <option value="508" ${selectedCat508}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other</option>
        <option value="227" ${selectedCat227}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Repair and maintenance service</option>
        <option value="11" ${selectedCat11}>&nbsp;&nbsp;&nbsp;&nbsp;Metalworking</option>
        <option value="67" ${selectedCat67}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Construction of metal structures</option>
        <option value="263" ${selectedCat263}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Houses and buildings</option>
        <option value="267" ${selectedCat267}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Metal products</option>
        <option value="542" ${selectedCat542}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Metal works</option>
        <option value="75" ${selectedCat75}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CNC-machining</option>
        <option value="62" ${selectedCat62}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Forgings, Fasteners </option>
        <option value="69" ${selectedCat69}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gas, Plasma, Laser cutting</option>
        <option value="66" ${selectedCat66}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MIG, TIG, Aluminum welding</option>
        <option value="9" ${selectedCat9}>&nbsp;&nbsp;&nbsp;&nbsp;Plastic and Rubber</option>
        <option value="54" ${selectedCat54}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Packaging</option>
        <option value="556" ${selectedCat556}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plastic goods</option>
        <option value="559" ${selectedCat559}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plastic processing technology</option>
        <option value="55" ${selectedCat55}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Blowing</option>
        <option value="57" ${selectedCat57}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Moulding</option>
        <option value="53" ${selectedCat53}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plastics welding and processing</option>
        <option value="560" ${selectedCat560}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plastic profiles</option>
        <option value="5" ${selectedCat5}>&nbsp;&nbsp;&nbsp;&nbsp;Printing </option>
        <option value="148" ${selectedCat148}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Advertising</option>
        <option value="150" ${selectedCat150}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Book/Periodicals printing</option>
        <option value="145" ${selectedCat145}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Labelling and packaging printing</option>
        <option value="7" ${selectedCat7}>&nbsp;&nbsp;&nbsp;&nbsp;Textile and Clothing</option>
        <option value="44" ${selectedCat44}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Clothing</option>
        <option value="45" ${selectedCat45}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Textile</option>
        <option value="8" ${selectedCat8}>&nbsp;&nbsp;&nbsp;&nbsp;Wood</option>
        <option value="337" ${selectedCat337}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other (Wood)</option>
        <option value="51" ${selectedCat51}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wooden building materials</option>
        <option value="47" ${selectedCat47}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wooden houses</option>
        <option value="3" ${selectedCat3}>Other</option>
        <option value="37" ${selectedCat37}>&nbsp;&nbsp;&nbsp;&nbsp;Creative industries</option>
        <option value="29" ${selectedCat29}>&nbsp;&nbsp;&nbsp;&nbsp;Energy technology</option>
        <option value="33" ${selectedCat33}>&nbsp;&nbsp;&nbsp;&nbsp;Environment</option>
        <option value="2" ${selectedCat2}>Service</option>
        <option value="25" ${selectedCat25}>&nbsp;&nbsp;&nbsp;&nbsp;Business services</option>
        <option value="35" ${selectedCat35}>&nbsp;&nbsp;&nbsp;&nbsp;Engineering</option>
        <option value="28" ${selectedCat28}>&nbsp;&nbsp;&nbsp;&nbsp;Information Technology and Telecommunications</option>
        <option value="581" ${selectedCat581}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Data processing, Web portals, E-marketing</option>
        <option value="576" ${selectedCat576}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Programming, Consultancy</option>
        <option value="121" ${selectedCat121}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Software, Hardware</option>
        <option value="122" ${selectedCat122}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Telecommunications</option>
        <option value="22" ${selectedCat22}>&nbsp;&nbsp;&nbsp;&nbsp;Tourism</option>
        <option value="141" ${selectedCat141}>&nbsp;&nbsp;&nbsp;&nbsp;Translation services</option>
        <option value="21" ${selectedCat21}>&nbsp;&nbsp;&nbsp;&nbsp;Transport and Logistics</option>
        <option value="111" ${selectedCat111}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Air</option>
        <option value="114" ${selectedCat114}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rail</option>
        <option value="112" ${selectedCat112}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Road</option>
        <option value="113" ${selectedCat113}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Water</option>
    </select>
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
