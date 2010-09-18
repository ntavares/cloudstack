<%@ page import="java.util.*" %>

<%@ page import="com.cloud.utils.*" %>

<%
    Locale browserLocale = request.getLocale();
    CloudResourceBundle t = CloudResourceBundle.getBundle("resources/resource", browserLocale);
%>
<!-- IP Address detail panel (begin) -->
<div class="main_title" id="right_panel_header">
    <div class="main_titleicon">
        <img src="images/title_ipicon.gif" alt="IP Address" /></div>
    <h1>
        IP Address
    </h1>
</div>
<div class="contentbox" id="right_panel_content">
    <div class="info_detailbox errorbox" id="after_action_info_container" style="display: none">
        <p id="after_action_info">
        </p>
    </div>
    <div class="tabbox" style="margin-top: 15px;">
        <div class="content_tabs on" id="tab_details">
            <%=t.t("Details")%></div>
        <div class="content_tabs off" id="tab_port_forwarding">
            <%=t.t("Port Forwarding")%></div>
        <div class="content_tabs off" id="tab_load_balancer">
            <%=t.t("Load Balancer")%></div>
    </div>  
    <div id="tab_content_details">
        <div class="grid_actionpanel">
            <div class="grid_actionbox" id="action_link">
                <div class="grid_actionsdropdown_box" id="action_menu" style="display: none;">
                    <ul class="actionsdropdown_boxlist" id="action_list">
                        <!--  
                    	<li> <a href="#"> Delete </a> </li>
                        <li> <a href="#"> Attach Disk </a> </li>
                        -->
                    </ul>
                </div>
            </div>
            <div class="grid_editbox">
            </div>
            <div class="gridheader_loaderbox" id="spinning_wheel" style="border: 1px solid #999;
                display: none;">
                <div class="gridheader_loader" id="icon">
                </div>
                <p id="description">
                    Detaching Disk &hellip;</p>
            </div>
            <div class="gridheader_message" id="action_message_box" style="border: 1px solid #999; display: none;">
                <p id="description"></p>
                <div class="close_button" id="close_button">
                </div>
            </div>           
        </div>
        <div class="grid_container">
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        IP:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="ipaddress">
                    </div>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        Zone:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="zonename">
                    </div>
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        VLAN:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="vlanname">
                    </div>
                </div>
            </div>           
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        Source NAT:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="source_nat">
                    </div>
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        Network Type:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="network_type">
                    </div>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        Domain:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="domain">
                    </div>
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        Account:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="account">
                    </div>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        Allocated:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="allocated">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Details ends here-->
    <!-- Port Forwarding start here-->
    <div id="tab_content_port_forwarding" style="display:none">
        <div class="grid_container" id="grid_container">
            <div class="grid_header">
                <div class="grid_header_cell" style="width: 20%">
                    <div class="grid_header_title">
                        Public Port</div>
                </div>
                <div class="grid_header_cell" style="width: 20%">
                    <div class="grid_header_title">
                        Private Port</div>
                </div>
                <div class="grid_header_cell" style="width: 29%">
                    <div class="grid_header_title">
                        Protocol</div>
                </div>
                <div class="grid_header_cell" style="width: 30%; border: none;">
                    <div class="grid_header_title">
                        Instance</div>
                </div>
            </div>
            <div class="grid_rows even" id="create_port_forwarding_row">
                <div class="grid_row_cell" style="width: 20%;">
                    <input id="public_port" class="text" style="width: 90%;" type="text" />
                    <div id="public_port_errormsg" class="errormsg" style="display: none;">Error msg will appear here</div>
                </div>
                <div class="grid_row_cell" style="width: 20%;">
                    <input id="private_port" class="text" style="width: 90%;" type="text" />
                    <div id="private_port_errormsg" class="errormsg" style="display: none;">Error msg will appear here</div>
                </div>
                <div class="grid_row_cell" style="width: 29%;">  
                   <select class="select" id="protocol">
                       <option value="TCP">TCP</option>
                       <option value="UDP">UDP</option>
                   </select>
                </div>
                <div class="grid_row_cell" style="width: 20%;">                   
                    <select class="select" style="width: 104px;" id="vm">
                    </select>
                </div>
                <div class="grid_row_cell" style="width: 10%;">
                    <div class="row_celltitles">
                        <a id="add_link" href="#">Add</a></div>
                </div>
            </div>  
        </div>
    </div>
    <!-- Port Forwarding ends here-->
    <!-- Load Balancer start here-->
    <div id="tab_content_load_balancer" style="display:none">
        <div class="grid_container">
            <div class="grid_header">
                <div class="grid_header_cell" style="width: 29%">
                    <div class="grid_header_title">
                        Name</div>
                </div>
                <div class="grid_header_cell" style="width: 20%">
                    <div class="grid_header_title">
                        Public Port</div>
                </div>
                <div class="grid_header_cell" style="width: 20%">
                    <div class="grid_header_title">
                        Private Port</div>
                </div>
                <div class="grid_header_cell" style="width: 30%; border: none;">
                    <div class="grid_header_title">
                        Algorithm</div>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 29%;">
                    <input class="text" style="width: 90%;" type="text" />
                </div>
                <div class="grid_row_cell" style="width: 20%;">
                    <input class="text" style="width: 90%;" type="text" />
                </div>
                <div class="grid_row_cell" style="width: 20%;">
                    <input class="text" style="width: 90%;" type="text" />
                </div>
                <div class="grid_row_cell" style="width: 20%;">
                    <select class="select" style="width: 90%;">
                        <option value="Source1">Source Name 1 </option>
                        <option value="Source2">Source Name 2 </option>
                    </select>
                </div>
                <div class="grid_row_cell" style="width: 10%;">
                    <div class="row_celltitles">
                        <a href="#">Add</a></div>
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 29%;">
                    <div class="row_celltitles">
                        LB#1</div>
                </div>
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        8080</div>
                </div>
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        80</div>
                </div>
                <div class="grid_row_cell" style="width: 30%;">
                    <div class="row_celltitles">
                        Source</div>
                </div>
                <div class="grid_detailspanel" style="display: block;">
                    <div class="grid_details_pointer">
                    </div>
                    <div class="grid_detailsbox">
                        <div class="grid_details_row odd">
                            <div class="grid_row_cell" style="width: 9%;">
                                <div class="row_celltitles">
                                    <img src="images/network_managevmicon.gif" /></div>
                            </div>
                            <div class="grid_row_cell" style="width: 60%;">
                                <select class="select" style="width: 90%;">
                                    <option value="Source1">Source Name A </option>
                                    <option value="Source2">Source Name B </option>
                                </select>
                            </div>
                            <div class="grid_row_cell" style="width: 30%;">
                                <div class="row_celltitles">
                                    <a href="#">Add</a></div>
                            </div>
                            <div class="gridrow_loaderbox" style="display: block;">
                                <div class="gridrow_loader">
                                </div>
                                <p>
                                    Adding instance to load balancer policy &hellip;</p>
                            </div>
                        </div>
                        <div class="grid_details_row">
                            <div class="grid_row_cell" style="width: 9%;">
                                <div class="row_celltitles">
                                    <img src="images/network_managevmicon.gif" /></div>
                            </div>
                            <div class="grid_row_cell" style="width: 60%;">
                                <div class="row_celltitles">
                                    1-2-2-TEST</div>
                            </div>
                            <div class="grid_row_cell" style="width: 30%;">
                                <div class="row_celltitles">
                                    <a href="#">Remove</a></div>
                            </div>
                            <div class="gridrow_loaderbox" style="display: none;">
                                <div class="gridrow_loader">
                                </div>
                                <p>
                                    Removing instance from load balancer policy &hellip;</p>
                            </div>
                        </div>
                        <div class="grid_details_row odd">
                            <div class="grid_row_cell" style="width: 9%;">
                                <div class="row_celltitles">
                                    <img src="images/network_managevmicon.gif" /></div>
                            </div>
                            <div class="grid_row_cell" style="width: 60%;">
                                <div class="row_celltitles">
                                    1-2-2-TEST</div>
                            </div>
                            <div class="grid_row_cell" style="width: 30%;">
                                <div class="row_celltitles">
                                    <a href="#">Remove</a></div>
                            </div>
                            <div class="gridrow_loaderbox" style="display: block;">
                                <div class="gridrow_loader">
                                </div>
                                <p>
                                    Removing instance from load balancer policy &hellip;</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 29%;">
                    <div class="row_celltitles">
                        LB#1</div>
                </div>
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        8080</div>
                </div>
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        80</div>
                </div>
                <div class="grid_row_cell" style="width: 30%;">
                    <div class="row_celltitles">
                        Source</div>
                </div>
                <div class="gridrow_loaderbox" style="display: block;">
                    <div class="gridrow_loader">
                    </div>
                    <p>
                        Adding load balancer policy &hellip;</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Load Balancer ends here-->
</div>
<!-- IP Address detail panel (end) -->


<div class="grid_rows odd" id="port_forwarding_template" style="display: none">
    
    <div id="row_container">
        <div class="grid_row_cell" style="width: 20%;">
            <div class="row_celltitles" id="public_port"></div>
        </div>
        <div class="grid_row_cell" style="width: 20%;">
            <div class="row_celltitles" id="private_port"></div>
        </div>
        <div class="grid_row_cell" style="width: 29%;">
            <div class="row_celltitles" id="protocol"></div>
        </div>
        <div class="grid_row_cell" style="width: 30%;">
            <div class="row_celltitles" id="vm_name"></div>
        </div> 
        <div class="gridrow_loaderbox" style="display: none;" id="spinning_wheel">
            <div class="gridrow_loader">
            </div>
            <p>
                Adding &hellip;</p>
        </div>
    </div>
    <div id="row_container_edit" style="display:none">
        <div class="grid_row_cell" style="width: 20%;">
            <input id="public_port" class="text" style="width: 90%;" type="text" />
            <div id="public_port_errormsg" class="errormsg" style="display: none;">
                Error msg will appear here</div>
        </div>
        <div class="grid_row_cell" style="width: 20%;">
            <input id="private_port" class="text" style="width: 90%;" type="text" />
            <div id="private_port_errormsg" class="errormsg" style="display: none;">
                Error msg will appear here</div>
        </div>
        <div class="grid_row_cell" style="width: 29%;">
            <select class="select" id="protocol">
                <option value="TCP">TCP</option>
                <option value="UDP">UDP</option>
            </select>
        </div>
        <div class="grid_row_cell" style="width: 20%;">
            <select class="select" style="width: 104px;" id="vm">
            </select>
        </div>
        <div class="grid_row_cell" style="width: 10%;">
            <div class="row_celltitles">
                <a id="add_link" href="#">Add</a></div>
        </div>
        <div class="gridrow_loaderbox" style="display: none;" id="spinning_wheel">
            <div class="gridrow_loader">
            </div>
            <p>
                Saving &hellip;</p>
        </div>
    </div>
</div>

