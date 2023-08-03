package otn.utilitarios;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.ResourceBundle;
import java.util.Set;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.ValueExpression;

import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.component.UIViewRoot;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.el.ValueBinding;
import javax.faces.model.SelectItem;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;


public class JSFUtils
{
    private static final String NO_RESOURCE_FOUND = "Missing resource: ";
    /*
* Method for taking a reference to a JSF binding expression and returning
* the matching object (or creating it).
* @param expression EL expression
* @return Managed object
*/

    public static Object resolveExpression(String expression)
    {
        FacesContext facesContext = getFacesContext();
        Application app = facesContext.getApplication();
        ExpressionFactory elFactory = app.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        ValueExpression valueExp =
            elFactory.createValueExpression(elContext, expression,
                                            Object.class);
        return valueExp.getValue(elContext);
    }
    /*
* Get FacesContext.
* @return FacesContext
*/

    public static FacesContext getFacesContext()
    {
        return FacesContext.getCurrentInstance();
    }
    /*
* Method for taking a reference to a JSF binding expression and returning
* the matching Boolean.
* @param expression EL expression
* @return Managed object
*/

    public static Boolean resolveExpressionAsBoolean(String expression)
    {
        return (Boolean)resolveExpression(expression);
    }
    /*
* Method for taking a reference to a JSF binding expression and returning
* the matching String (or creating it).
* @param expression EL expression
* @return Managed object
*/

    public static String resolveExpressionAsString(String expression)
    {
        return (String)resolveExpression(expression);
    }
    /*
* Convenience method for resolving a reference to a managed bean by name
* rather than by expression.
* @param beanName name of managed bean
* @return Managed object
*/

    public static Object getManagedBeanValue(String beanName)
    {
        StringBuffer buff = new StringBuffer("#{");
        buff.append(beanName);
        buff.append("}");
        return resolveExpression(buff.toString());
    }
    /*
* Method for setting a new object into a JSF managed bean
* Note: will fail silently if the supplied object does
* not match the type of the managed bean.
* @param expression EL expression
* @param newValue new value to set
*/

    public static void setExpressionValue(String expression,
                                          Object newValue)
    {
        FacesContext ctx = getFacesContext();
        Application app = ctx.getApplication();
        ValueBinding bind = app.createValueBinding(expression);
        //Check that the input newValue can be cast to the property type
        //expected by the managed bean.
        //If the managed Bean expects a primitive we rely on Auto-Unboxing
        //I could do a more comprehensive check and conversion from the object
        //to the equivilent primitive but life is too short
        Class bindClass = bind.getType(ctx);
        if (bindClass.isPrimitive() || bindClass.isInstance(newValue))
        {
            bind.setValue(ctx, newValue);
        }
    }
    /*
* Convenience method for setting the value of a managed bean by name
* rather than by expression.
* @param beanName name of managed bean
* @param newValue new value to set
*/

    public static void setManagedBeanValue(String beanName,
                                           Object newValue)
    {
        StringBuffer buff = new StringBuffer("#{");
        buff.append(beanName);
        buff.append("}");
        setExpressionValue(buff.toString(), newValue);
    }
    /*
* Convenience method for setting Session variables.
* @param key object key
* @param object value to store
*/

    public static void storeOnSession(String key, Object object)
    {
        FacesContext ctx = getFacesContext();
        Map sessionState = ctx.getExternalContext().getSessionMap();
        sessionState.put(key, object);
    }

    /**
     * Convenience method for getting Session variables.
     * @param key object key
     * @return session object for key
     */
    public static Object getFromSession(String key)
    {
        FacesContext ctx = getFacesContext();
        Map sessionState = ctx.getExternalContext().getSessionMap();
        return sessionState.get(key);
    }
    /*
* Pulls a String resource from the property bundle that
* is defined under the application &lt;message-bundle&gt; element in
* the faces config. Respects Locale
* @param key string message key
* @return Resource value or placeholder error String
*/

    public static String getStringFromBundle(String key)
    {
        ResourceBundle bundle = getBundle();
        return getStringSafely(bundle, key, null);
    }
    /*
* Convenience method to construct a <code>FacesMesssage</code>
* from a defined error key and severity
* This assumes that the error keys follow the convention of
* using <b>_detail</b> for the detailed part of the
* message, otherwise the main message is returned for the
* detail as well.
* @param key for the error message in the resource bundle
* @param severity severity of message
* @return Faces Message object
*/

    public static FacesMessage getMessageFromBundle(String key,
                                                    FacesMessage.Severity severity)
    {
        ResourceBundle bundle = getBundle();
        String summary = getStringSafely(bundle, key, null);
        String detail = getStringSafely(bundle, key + "_detail", summary);
        FacesMessage message = new FacesMessage(summary, detail);
        message.setSeverity(severity);
        return message;
    }
    /*
* Add JSF error message.
* @param msg error message string
*/

    public static void addFacesErrorMessage(String msg)
    {
        FacesContext ctx = getFacesContext();
        FacesMessage fm =
            new FacesMessage(FacesMessage.SEVERITY_ERROR, msg, "");
        ctx.addMessage(getRootViewComponentId(), fm);
    }
    /*
* Add JSF error message for a specific attribute.
* @param attrName name of attribute
* @param msg error message string
*/

    public static void addFacesErrorMessage(String attrName, String msg)
    {
        // TODO: Need a way to associate attribute specific messages
        // with the UIComponent's Id! For now, just using the view id.
        //TODO: make this use the internal getMessageFromBundle?
        FacesContext ctx = getFacesContext();
        FacesMessage fm =
            new FacesMessage(FacesMessage.SEVERITY_ERROR, attrName, msg);
        ctx.addMessage(getRootViewComponentId(), fm);
    }
    // Informational getters
    /*
* Get view id of the view root.
* @return view id of the view root
*/

    public static String getRootViewId()
    {
        return getFacesContext().getViewRoot().getViewId();
    }

    /**
     * Get component id of the view root.
     * @return component id of the view root
     */
    public static String getRootViewComponentId()
    {
        return getFacesContext().getViewRoot().getId();
    }
    /*
* Internal method to pull out the correct local
* message bundle
*/

    private static ResourceBundle getBundle()
    {
        FacesContext ctx = getFacesContext();
        UIViewRoot uiRoot = ctx.getViewRoot();
        Locale locale = uiRoot.getLocale();
        ClassLoader ldr = Thread.currentThread().getContextClassLoader();
        return ResourceBundle.getBundle(ctx.getApplication().getMessageBundle(),
                                        locale, ldr);
    }
    /*
* Get an HTTP Request attribute.
* @param name attribute name
* @return attribute value
*/

    public static Object getRequestAttribute(String name)
    {
        return getFacesContext().getExternalContext().getRequestMap().get(name);
    }
    /*
* Set an HTTP Request attribute.
* @param name attribute name
* @param value attribute value
*/

    public static void setRequestAttribute(String name, Object value)
    {
        getFacesContext().getExternalContext().getRequestMap().put(name,
                                                                   value);
    }
    /*
* Internal method to proxy for resource keys that don't exist
*/

    private static String getStringSafely(ResourceBundle bundle,
                                          String key, String defaultValue)
    {
        String resource = null;
        try
        {
            resource = bundle.getString(key);
        } catch (MissingResourceException mrex)
        {
            if (defaultValue != null)
            {
                resource = defaultValue;
            } else
            {
                resource = NO_RESOURCE_FOUND + key;
            }
        }
        return resource;
    }

    public static SelectItem[] getSelectItems(List<?> entities,
                                              boolean selectOne)
    {
        int size = selectOne ? entities.size() + 1 : entities.size();
        SelectItem[] items = new SelectItem[size];
        int i = 0;
        if (selectOne)
        {
            items[0] = new SelectItem("", "---");
            i++;
        }
        for (Object x : entities)
        {
            items[i++] = new SelectItem(x, x.toString());
        }
        return items;
    }

    public static void ensureAddErrorMessage(Exception ex,
                                             String defaultMsg)
    {
        String msg = ex.getLocalizedMessage();
        if (msg != null && msg.length() > 0)
        {
            addErrorMessage(msg);
        } else
        {
            addErrorMessage(defaultMsg);
        }
    }

    public static void addErrorMessages(List<String> messages)
    {
        for (String message : messages)
        {
            addErrorMessage(message);
        }
    }

    public static void addErrorMessage(String msg)
    {
        FacesMessage facesMsg =
            new FacesMessage(FacesMessage.SEVERITY_ERROR, msg, msg);
        FacesContext.getCurrentInstance().addMessage(null, facesMsg);
    }

    public static void addSuccessMessage(String msg)
    {
        FacesMessage facesMsg =
            new FacesMessage(FacesMessage.SEVERITY_INFO, msg, msg);
        FacesContext.getCurrentInstance().addMessage("successInfo",
                                                     facesMsg);
    }

    public static String getRequestParameter(String key)
    {
        return FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get(key);
    }

    public static <T> List<T> arrayToList(T[] arr)
    {
        if (arr == null)
        {
            return new ArrayList<T>();
        }
        return Arrays.asList(arr);
    }

    public static <T> Set<T> arrayToSet(T[] arr)
    {
        if (arr == null)
        {
            return new HashSet<T>();
        }
        return new HashSet(Arrays.asList(arr));
    }

    public static Object[] collectionToArray(Collection<?> c)
    {
        if (c == null)
        {
            return new Object[0];
        }
        return c.toArray();
    }

    public static <T> List<T> setToList(Set<T> set)
    {
        return new ArrayList<T>(set);
    }

    public static String getAsConvertedString(Object object,
                                              Converter converter)
    {
        return converter.getAsString(FacesContext.getCurrentInstance(),
                                     null, object);
    }

    /**
     * Locate an UIComponent in view root with its component id. Use a recursive way to achieve this.
     * @param id UIComponent id
     * @return UIComponent object
     */
    public static UIComponent findComponentInRoot(String id)
    {
        UIComponent component = null;
        FacesContext facesContext = FacesContext.getCurrentInstance();
        if (facesContext != null)
        {
            UIComponent root = facesContext.getViewRoot();
            component = findComponent(root, id);
        }
        return component;
    }

    /**
     * Locate an UIComponent from its root component.
     * Taken from http://www.jroller.com/page/mert?entry=how_to_find_a_uicomponent
     * @param base root Component (parent)
     * @param id UIComponent id
     * @return UIComponent object
     */
    public static UIComponent findComponent(UIComponent base, String id)
    {
        if (base.getId().equals(id))
            return base;

        UIComponent children = null;
        UIComponent result = null;
        Iterator childrens = base.getFacetsAndChildren();
        while (childrens.hasNext() && (result == null))
        {
            children = (UIComponent)childrens.next();
            if ((children.getId() != null && children.getId().equals(id)))
            {
                result = children;
                break;
            }
            result = findComponent(children, id);
            if (result != null)
            {
                break;
            }
        }
        return result;
    }

    public static String getCollectionAsString(Collection<?> collection)
    {
        if (collection == null || collection.size() == 0)
        {
            return "(No Items)";
        }
        StringBuffer sb = new StringBuffer();
        int i = 0;
        for (Object item : collection)
        {
            if (i > 0)
            {
                sb.append("<br />");
            }
            sb.append(item);
            i++;
        }
        return sb.toString();
    }

    /**
     * Returns ExternalContext from FacesContext
     * @return
     */
    public static ExternalContext getExternalContext()
    {
        return getFacesContext().getExternalContext();
    }

    /**
     * Returns HttpServletRequest from FacesContext
     * @return
     */
    public static HttpServletRequest getHttpServletRequest()
    {
        return (HttpServletRequest)getExternalContext().getRequest();
    }

    /**
     * Returns Logged in User's IP Address
     * @return
     */
    public static String getRemoteHost()
    {
        return getHttpServletRequest().getRemoteHost();
    }

    /**
     * Returns logged-in user id
     * @return
     */
    public static String getLoggedInUserId()
    {
        return getExternalContext().getRemoteUser();
    }

    /**
     * Returns context path of the web project.
     * @return
     */
    public static String getContextPath()
    {
        ServletContext servletContext =
            (ServletContext)getExternalContext().getContext();
        return servletContext.getContextPath();
    }
}
