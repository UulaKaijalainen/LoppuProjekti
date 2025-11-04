function Register() {

    return <>
        <h1>Register</h1>
        <form>
            <label>
                Name:
                <input type="text" name="name" />
            </label>
            <label>
                Email:
                <input type="email" name="email" />
            </label>

            <label htmlFor="password">Password:</label>
            <input type="password" name="password" />

            <label htmlFor="confirm-password">Confirm Password:</label>
            <input type="password" name="confirm-password" />

            <label htmlFor="age">Age:</label>
            <input type="number" name="age" />

            <label htmlFor="city">City:</label>
            <input type="text" name="city" />

            <button type="submit">Register</button>
        </form>
    </>

}
export default Register;