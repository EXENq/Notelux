<#import "parts/common.ftlh" as c>

<@c.page>
<#include "parts/commentForm.ftlh">
<table class="table caption-top">
    <caption>List of comments</caption>
    <thead class="table-dark">
    <tr>
        <th scope="col">Author</th>
        <th scope="col">Text</th>
    </tr>
    </thead>
    <tbody>
    <#list comments as comment>
    <tr>
        <td>${comment.authorName}</td>
        <td>${comment.text}</td>
    </tr>
    </#list>
    </tbody>
</table>
</@>