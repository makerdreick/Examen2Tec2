 package com.emergentes.controlador;
import com.emergentes.controlador.modelo.Categoria;
import com.emergentes.controlador.modelo.Productos;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Dreick Lap1
 */
@WebServlet(name = "ProductoController", urlPatterns = {"/ProductoController"})
public class ProductoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = (request.getParameter("op").equals(""))? "listar" : request.getParameter("op");
        Categoria c = new Categoria(0," ");
        Productos lib = new Productos(0,"","","",c);
        int id;
        HttpSession ses = request.getSession();
        List<Productos> lista = (List<Productos>)ses.getAttribute("Productos2");
        List<Categoria> categorias = (List<Categoria>)ses.getAttribute("cates");
        
        switch(op)
        {
            case "nuevo":
                if(lista.size()== 0)
                {
                    lib.setId(1);
                }
                else 
                {
                    lib.setId(lista.get(lista.size()-1).getId()+1);
                }
                request.setAttribute("categorias", categorias);
                request.setAttribute("lib", lib);
                request.setAttribute("tipo", "new");
                request.getRequestDispatcher("editProductos.jsp").forward(request, response);
                break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                lib =lista.get(posNodoproductos2(id,request));
                request.setAttribute("categorias", categorias);
                request.setAttribute("lib", lib);
                request.setAttribute("tipo", "edit");
                request.getRequestDispatcher("editProductos.jsp").forward(request, response);
                break;
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                int pos = posNodoproductos2(id,request);
                lista.remove(pos);
                response.sendRedirect("Productos.jsp");
                break;
            case "listar":
                request.setAttribute("Productos2", lista);
                response.sendRedirect("Productos.jsp");
                break;
        }
    }   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String descripcion = request.getParameter("descripcion");
        String cantidad = request.getParameter("cantidad");
        String precio = request.getParameter("precio");
        int idcat = Integer.parseInt(request.getParameter("idcat"));
        Categoria cate = nodoCategoria(idcat,request);
        
        String tipo = request.getParameter("tipo");
        
        Productos l = new Productos();
        l.setId(id);
        l.setDescripcion(descripcion);
        l.setCantidad(cantidad);
        l.setPrecio(precio);
        l.setCate(cate);
        
        HttpSession ses = request.getSession();
        List<Productos> Productos2 = (List<Productos>)ses.getAttribute("Productos2");
        
        
        if(tipo.equals("new"))
        {
            Productos2.add(l);
        }
        else 
        {
            Productos2.set(posNodoproductos2(id,request), l);
        }
        response.sendRedirect("Productos.jsp");
    }
    
    public int posNodoproductos2(int id, HttpServletRequest request)
    {
        int index=-1;
        HttpSession ses = request.getSession();
        List<Productos> lista = (List<Productos>)ses.getAttribute("Productos2");
        for(int i = 0; i< lista.size();i++)
        {
            if(lista.get(i).getId() == id)
            {
                index=i;
                break;
            }
        }
        return index;
    }
    
    public int posNodoCategoria(int id, HttpServletRequest request)
    {
        int index =-1;
        HttpSession ses = request.getSession();
        List<Categoria> lista = (List<Categoria>)ses.getAttribute("cates");
        for(int i=0;i< lista.size();i++)
        {
            if(lista.get(i).getId()==id)
            {
                index = i;
                break;
            }
        }
        return index;
    }
    
    public Categoria nodoCategoria(int id,HttpServletRequest request)
    {
        Categoria aux = new Categoria();
        HttpSession ses = request.getSession();
        List<Categoria> lista = (List<Categoria>)ses.getAttribute("cates");
        for(Categoria obj : lista)
        {
            if(obj.getId()==id)
            {
                aux=obj;
            }
        }
        return aux;
    }
            
}