package com.example.userlist.portlet.render;

import com.example.userlist.User;
import com.example.userlist.constants.MVCCommandNames;
import com.example.userlist.constants.UserListPortletKeys;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCRenderCommand;
import com.liferay.portal.kernel.util.ParamUtil;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import org.osgi.service.component.annotations.Component;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * RenderCommand para renderizar la lista de usuarios.
 *
 * @author angel
 *
 */
@Component(
        immediate = true,
        property = {
                "javax.portlet.name=" + UserListPortletKeys.USERLIST,
                "mvc.command.name=" + MVCCommandNames.LIST_USERS
        },
        service = MVCRenderCommand.class
)
public class UserListMVCRenderCommand implements MVCRenderCommand {

    private List<User> users;

    /**
     * Inicializacion una lista simulada de usuarios.
     */
    public UserListMVCRenderCommand() {
        users = new ArrayList<>();
        for (int i = 1; i <= 20; i++) {
            users.add(new User(i, "admin" + i + "@yopmail.com", "admin" + i, "admin" + i, "admin" + i));
        }
    }

    @Override
    public String render(RenderRequest renderRequest, RenderResponse renderResponse) {
        // Obtener parámetros de búsqueda y paginación
        String searchField = ParamUtil.getString(renderRequest, "searchField", "");
        String searchValue = ParamUtil.getString(renderRequest, "searchValue", "");
        int page = ParamUtil.getInteger(renderRequest, "page", 1);
        int pageSize = 5;

        // Filtrar usuarios
        List<User> filteredUsers = users.stream()
                .filter(user -> {
                    switch (searchField) {
                        case "name":
                            return user.getName().toLowerCase().contains(searchValue.toLowerCase());
                        case "surname1":
                            return user.getSurname1().toLowerCase().contains(searchValue.toLowerCase());
                        case "surname2":
                            return user.getSurname2().toLowerCase().contains(searchValue.toLowerCase());
                        case "email":
                            return user.getEmail().toLowerCase().contains(searchValue.toLowerCase());
                        default:
                            return true;
                    }
                })
                .collect(Collectors.toList());

        // Paginación
        int total = filteredUsers.size();
        int start = (page - 1) * pageSize;
        int end = Math.min(start + pageSize, total);
        List<User> paginatedUsers = filteredUsers.subList(start, end);

        // Pasar datos a la vista
        renderRequest.setAttribute("users", paginatedUsers);
        renderRequest.setAttribute("total", total);
        renderRequest.setAttribute("page", page);
        renderRequest.setAttribute("pageSize", pageSize);

        return "/listaUsuarios.jsp";
    }
}
