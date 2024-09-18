package com.example.userlist;

/**
 * Clase que simula un usuario.
 *
 * @author angel
 */
public class User {
    private int id;
    private String email;
    private String name;
    private String surname1;
    private String surname2;

    /**
     * Constructor que inicializa un usuario con los valores proporcionados.
     *
     * @param id El ID del usuario.
     * @param email El correo electrónico del usuario.
     * @param name El nombre del usuario.
     * @param surname1 El primer apellido del usuario.
     * @param surname2 El segundo apellido del usuario.
     */
    public User(int id, String email, String name, String surname1, String surname2) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.surname1 = surname1;
        this.surname2 = surname2;
    }

    /**
     * Obtiene el ID del usuario.
     *
     * @return El ID del usuario.
     */
    public int getId() {
        return id;
    }

    /**
     * Establece el ID del usuario.
     *
     * @param id El ID del usuario.
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Obtiene el correo electrónico del usuario.
     *
     * @return El correo electrónico del usuario.
     */
    public String getEmail() {
        return email;
    }

    /**
     * Establece el correo electrónico del usuario.
     *
     * @param email El correo electrónico del usuario.
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Obtiene el nombre del usuario.
     *
     * @return El nombre del usuario.
     */
    public String getName() {
        return name;
    }

    /**
     * Establece el nombre del usuario.
     *
     * @param name El nombre del usuario.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Obtiene el primer apellido del usuario.
     *
     * @return El primer apellido del usuario.
     */
    public String getSurname1() {
        return surname1;
    }

    /**
     * Establece el primer apellido del usuario.
     *
     * @param surname1 El primer apellido del usuario.
     */
    public void setSurname1(String surname1) {
        this.surname1 = surname1;
    }

    /**
     * Obtiene el segundo apellido del usuario.
     *
     * @return El segundo apellido del usuario.
     */
    public String getSurname2() {
        return surname2;
    }

    /**
     * Establece el segundo apellido del usuario.
     *
     * @param surname2 El segundo apellido del usuario.
     */
    public void setSurname2(String surname2) {
        this.surname2 = surname2;
    }
}
