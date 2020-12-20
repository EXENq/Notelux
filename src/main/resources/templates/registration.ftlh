<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
Registration new user
${message?ifExists}
<@l.login "/registration" />
</@c.page>