<div id="aa" class="easyui-accordion" fit="true"
		style="width: 150px; height: 850px;">
		<% if username="admin" then %>
			<div title="初始信息管理设置" icon="icon-datetrg" style='overflow: auto; padding: 10px;' >
				<table width="160px" border="0">
					<tr>
						<td>
							<img src="../images/jobstp/ico_unlock.png" border="0">&nbsp; 
							<a href="addUserInfo.asp">新增用户信息</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/ico_unlock.png" border="0">&nbsp; 
							<a href="listUserInfo.asp">管理用户信息</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/order_trigr.png" border="0">&nbsp; 
							<a href="addEduType.asp">新增教育方式</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/order_trigr.png" border="0">&nbsp; 
							<a href="listEduType.asp">管理教育方式</a>
						</td>
					</tr>
				</table>
			</div>
			<div title="基本信息管理设置" icon="icon-trigger" style="overflow: auto; padding: 10px;">
				<table width="150px" border="0">
					<tr>
						<td>
							<img src="../images/jobstp/order_part.gif" border="0">&nbsp; 
							<a href="addSchName.asp">新增学校名称</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/order_part.gif" border="0">&nbsp; 
							<a href="listSchName.asp">管理学校名称</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/order_job.png" border="0">&nbsp; 
							<a href="addSpecName.asp">新增专业名称</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/order_job.png" border="0">&nbsp; 
							<a href="listSpecName.asp">管理专业名称</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/users_add.gif" border="0">&nbsp; 
							<a href="addComName.asp">新增推荐人信息</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/users_add.gif" border="0">&nbsp; 
							<a href="listComName.asp">管理推荐人信息</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/order_pass.gif" border="0">&nbsp; 
							<a href="addSchCenter.asp">新增学习中心信息</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/order_pass.gif" border="0">&nbsp; 
							<a href="listSchCenter.asp">管理学习中心信息</a>
						</td>
					</tr>
				</table>
			</div>
		<% end if%>
		<div title="学生信息管理设置" icon="icon-user" selected="true" style="overflow: auto; padding: 10px;">
			<table width="150px" border="0">
				<tr>
					<td>
						<img src="../images/jobstp/user.gif" border="0">&nbsp; 
						<a href="addStudent.asp">新增学生信息</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="../images/jobstp/users_add.gif" border="0">&nbsp; 
						<a href="listStudent.asp">在读学生信息</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="../images/jobstp/users_edit.gif" border="0">&nbsp; 
						<a href="listGraduStudent.asp">毕业学生信息</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="../images/jobstp/users_delete.gif" border="0">&nbsp; 
						<a href="listLeaveStudent.asp">退学学生信息</a>
					</td>
				</tr>
			</table>
		</div>
	</div>