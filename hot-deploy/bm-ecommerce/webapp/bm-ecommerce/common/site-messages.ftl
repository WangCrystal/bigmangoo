
<#assign errorMessage = requestAttributes._BM_ERROR_MESSAGE_?if_exists>

<#if errorMessage?has_content>
    <div class="alert alert-danger text-center" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <p>
            ${(errorMessage)!}
        </p>
    </div>
</#if>

<#assign successMessage = requestAttributes._BM_SUCCESS_MESSAGE_?if_exists>

<#if successMessage?has_content>
<div class="alert alert-success text-center" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <p>
    ${(successMessage)!}
    </p>
</div>
</#if>
