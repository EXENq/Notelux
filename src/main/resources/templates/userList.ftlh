<#import "parts/common.ftlh" as c>

<@c.page>
	<table class="table caption-top">
		<caption class="fs-2 text-center">List of users</caption>
		<thead class="table-dark">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Role</th>
				<th scope="col"></th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<#list users as user>
				 <tr>
					 <th scope="row">${user.id}</th>
					 <td>${user.username}</td>
					 <td>
				 		<#list user.roles as role>
				 			${role}<#sep>,
				 		</#list>
					 </td>
				 	<td><a href="/user/${user.id}" class="btn btn-primary">edit</a></td>
					 <td>
						 <a href="/user/delete/${user.id}">
						 	<i class="fas fa-trash-alt"></i>
					 	</a>
					 </td>
				 </tr>
			</#list>
		</tbody>
	</table>
</@>