<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="descripcionErrorCognito">
        <xsl:param name="recursoCognito"/>
        <xsl:param name="codigoErrorCognito"/>
      <xsl:choose>
        <xsl:when test="$codigoErrorCognito='CodeDeliveryFailureException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Fallo en la entrega de código de verificación')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='InternalErrorException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Ocurrió un error interno en Amazon Cognito')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='InvalidLambdaResponseException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Se encontró una respuesta Lambda inválida')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='InvalidParameterException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Se encontró un parámetro inválido')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='InvalidPasswordException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Se encontró una contraseña invalida')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='InvalidSmsRoleAccessPolicyException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Se encontró que el rol no tiene permisos para enviar mensajes en Amazon')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='InvalidSmsRoleTrustRelationshipException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Se encontró que la relación de confianza no es válida para el rol proporcionado en la configuración de SMS')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='NotAuthorizedException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Se encontró que el usuario no esta autorizado')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='PreconditionNotMetException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Se encontró que una pre-condición no se cumplio')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='ResourceNotFoundException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': No se encontró el recurso solicitado')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='TooManyRequestsException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Se encontró que ha realizado muchas peticiones a la operación')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='UnexpectedLambdaException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Se encontró una respuesta Lambda inesperada')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='UnsupportedUserStateException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Se encontró que la petición fallo debido a que el usuario esta en un estado no soportado')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='UserLambdaValidationException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Se encontró una excepción de validacion de usuario con el servicio AWS Lambda')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='UsernameExistsException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Se encontró que el usuario ya existe')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='UserNotFoundException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': No se encontró el usuario')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='AliasExistsException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': El alias especificado ya esta asignado a otra cuenta')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='CodeMismatchException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Verificar que la información proporcionada es correcta')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='ExpiredCodeException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': El código ha caducado. Inténtalo más tarde (contacta al administrador)')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='InvalidUserPoolConfigurationException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Información no válida. Verifica que los datos introducidos sean correctos')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='MFAMethodNotFoundException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Error inesperado. Inténtalo nuevamente')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='PasswordResetRequiredException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Verificar que la contraseña proporcionada es correcta')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='UserNotConfirmedException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Verificar que la información proporcionada es correcta')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='AccessDeniedException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Acceso no válido. Contácte al administrador')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='IncompleteSignature'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Verificar que la información proporcionada es correcta')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='InternalFailure'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Error inesperado. Inténtalo nuevamente')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='InvalidAction'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Verificar que la información proporcionada es correcta')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='InvalidClientTokenId'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Verificar que la información proporcionada es correcta')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='InvalidParameterCombination'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Combinación de parámetros invalida')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='InvalidParameterValue'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Verificar que la información proporcionada es correcta')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='InvalidQueryParameter'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Se ha presentado un error Inténtalo más tarde')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='MalformedQueryString'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Verificar que la información proporcionada es correcta')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='MissingAction'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Es necesario completar todos los campos')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='MissingAuthenticationToken'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Verificar que la información proporcionada es correcta')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='MissingParameter'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Verificar que la información proporcionada es correcta')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='OptInRequired'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Regístrarse para acceder')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='RequestExpired'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': El tiempo expiró. Inténtelo nuevamente')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='ServiceUnavailable'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Error en servidor. Inténtalo más tarde')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='ThrottlingException'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Solicitud rechazada debido a la restricción de peticiones')"/>
        </xsl:when>
        <xsl:when test="$codigoErrorCognito='ValidationError'">
          <xsl:value-of select="concat('Se ha recibido un error en el servicio ', $recursoCognito, ': Verificar que la información proporcionada es correcta')"/>
        </xsl:when>
        <xsl:otherwise>Falló generico en el Amazon Cognito</xsl:otherwise>
      </xsl:choose>
    </xsl:template>
</xsl:stylesheet>