<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-floating mb-3">
        <input type="text" class="form-control" name="username" id="floatingInput" placeholder="User name">
        <label for="floatingInput">User Name</label>
    </div>
    <div class="form-floating">
        <input type="password" class="form-control" name="password" id="floatingPassword" placeholder="Password">
        <label for="floatingPassword">Password</label>
    </div>
    <#if isRegisterForm>
    <div class="form-floating">
        <input type="email" class="form-control" name="email" id="floatingEmail" placeholder="E-mail">
        <label for="floatingEmail">E-mail</label>
    </div>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <#if !isRegisterForm><div><a href="/registration">registration new user</a></div></#if>
    <button type="submit" class="btn btn-primary mt-3">
        <#if isRegisterForm>Create<#else>Sign In</#if>
    </button>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary">Sign Out</button>
</form>
</#macro>