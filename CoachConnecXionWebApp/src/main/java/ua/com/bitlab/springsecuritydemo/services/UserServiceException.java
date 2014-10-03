package ua.com.bitlab.springsecuritydemo.services;

/**
 * User: anna
 * Date: 10/12/12
 */
public class UserServiceException extends RuntimeException {

    private final String printableMessage;

    public UserServiceException(String message, String printableMessage) {
        super(message);
        this.printableMessage = printableMessage;
    }

    public UserServiceException(String message, Throwable cause, String printableMessage) {
        super(message, cause);
        this.printableMessage = printableMessage;
    }

    public String getPrintableMessage() {
        return printableMessage;
    }
}
