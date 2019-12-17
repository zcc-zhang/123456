package cn.hyj.exception;

/**
 * 发送邮件的异常
 */
public class MailException extends Exception {

    private String message;//自定义异常信息

    @Override
    public String getMessage() {
        return message;
    }

    public MailException(String message){
        this.message=message;
    }
}
