<div id="aa" class="easyui-accordion" fit="true"
		style="width: 150px; height: 850px;">
		<% if username="admin" then %>
			<div title="��ʼ��Ϣ��������" icon="icon-datetrg" style='overflow: auto; padding: 10px;' >
				<table width="160px" border="0">
					<tr>
						<td>
							<img src="../images/jobstp/ico_unlock.png" border="0">&nbsp; 
							<a href="addUserInfo.asp">�����û���Ϣ</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/ico_unlock.png" border="0">&nbsp; 
							<a href="listUserInfo.asp">�����û���Ϣ</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/order_trigr.png" border="0">&nbsp; 
							<a href="addEduType.asp">����������ʽ</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/order_trigr.png" border="0">&nbsp; 
							<a href="listEduType.asp">���������ʽ</a>
						</td>
					</tr>
				</table>
			</div>
			<div title="������Ϣ��������" icon="icon-trigger" style="overflow: auto; padding: 10px;">
				<table width="150px" border="0">
					<tr>
						<td>
							<img src="../images/jobstp/order_part.gif" border="0">&nbsp; 
							<a href="addSchName.asp">����ѧУ����</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/order_part.gif" border="0">&nbsp; 
							<a href="listSchName.asp">����ѧУ����</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/order_job.png" border="0">&nbsp; 
							<a href="addSpecName.asp">����רҵ����</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/order_job.png" border="0">&nbsp; 
							<a href="listSpecName.asp">����רҵ����</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/users_add.gif" border="0">&nbsp; 
							<a href="addComName.asp">�����Ƽ�����Ϣ</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/users_add.gif" border="0">&nbsp; 
							<a href="listComName.asp">�����Ƽ�����Ϣ</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/order_pass.gif" border="0">&nbsp; 
							<a href="addSchCenter.asp">����ѧϰ������Ϣ</a>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../images/jobstp/order_pass.gif" border="0">&nbsp; 
							<a href="listSchCenter.asp">����ѧϰ������Ϣ</a>
						</td>
					</tr>
				</table>
			</div>
		<% end if%>
		<div title="ѧ����Ϣ��������" icon="icon-user" selected="true" style="overflow: auto; padding: 10px;">
			<table width="150px" border="0">
				<tr>
					<td>
						<img src="../images/jobstp/user.gif" border="0">&nbsp; 
						<a href="addStudent.asp">����ѧ����Ϣ</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="../images/jobstp/users_add.gif" border="0">&nbsp; 
						<a href="listStudent.asp">�ڶ�ѧ����Ϣ</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="../images/jobstp/users_edit.gif" border="0">&nbsp; 
						<a href="listGraduStudent.asp">��ҵѧ����Ϣ</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="../images/jobstp/users_delete.gif" border="0">&nbsp; 
						<a href="listLeaveStudent.asp">��ѧѧ����Ϣ</a>
					</td>
				</tr>
			</table>
		</div>
	</div>