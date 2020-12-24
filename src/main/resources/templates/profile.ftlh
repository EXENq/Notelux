<#import "parts/common.ftlh" as c>

<@c.page>
<h5>${username}</h5>
${message?ifExists}
<form method="post">
    <div class="form-floating mb-3">
        <input type="password" class="form-control" name="password" id="floatingPassword" placeholder="Password">
        <label for="floatingPassword">Password</label>
    </div>
    <div class="form-floating mb-3">
        <input type="email" class="form-control" name="email" id="floatingEmail" placeholder="E-mail" value="${email!''}">
        <label for="floatingEmail">E-mail</label>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit" class="btn btn-primary">Save</button>
</form>
</@c.page>