<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-floating mb-3">
        <input type="text" class="form-control <#if (errorsMap['usernameError'])??>is-invalid</#if>"
               name="username" id="floatingInput" placeholder="User name" value="<#if user??>${user.username}</#if>">
        <label for="floatingInput">User Name</label>
        <#if (errorsMap['usernameError'])??>
            <div class="invalid-feedback">
                ${errorsMap['usernameError']}
            </div>
        </#if>
    </div>
    <div class="form-floating mb-3">
        <input type="password" class="form-control <#if (errorsMap['passwordError'])??>is-invalid</#if>" name="password"
               id="floatingPassword" placeholder="Password">
        <label for="floatingPassword">Password</label>
        <#if (errorsMap['passwordError'])??>
            <div class="invalid-feedback">
                ${errorsMap['passwordError']}
            </div>
        </#if>
    </div>
    <#if isRegisterForm>
        <div class="form-floating mb-3">
            <input type="password" class="form-control <#if (errorsMap['password2Error'])??>is-invalid</#if>" name="password2"
                   id="floatingPassword2" placeholder="Password confirm">
            <label for="floatingPassword2">Password confirm</label>
            <#if (errorsMap['password2Error'])??>
                <div class="invalid-feedback">
                    ${errorsMap['password2Error']}
                </div>
            </#if>
        </div>
        <div class="form-floating mb-3">
            <input type="email" class="form-control <#if (errorsMap['emailError'])??>is-invalid</#if>"
                   name="email" id="floatingEmail" placeholder="E-mail" value="<#if user??>${user.email}</#if>">
            <label for="floatingEmail">E-mail</label>
            <#if (errorsMap['emailError'])??>
                <div class="invalid-feedback">
                    ${errorsMap['emailError']}
                </div>
            </#if>
        </div>
        <div>
            <div class="g-recaptcha" data-sitekey="site_key"></div>
            <#if captchaError??>
                <div class="alert alert-danger" role="alert">
                    ${captchaError}
                </div>
            </#if>
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
    <button type="submit" class="btn btn-primary"><#if user??>Sign Out<#else>Log in</#if></button>
</form>
</#macro>