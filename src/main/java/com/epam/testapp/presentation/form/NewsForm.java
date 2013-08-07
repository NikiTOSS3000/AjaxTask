package com.epam.testapp.presentation.form;

import com.epam.testapp.model.News;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorActionForm;

public class NewsForm extends ValidatorActionForm {

    private News newsMessage;
    private List<News> newsList;
    private String[] checkboxes;
    private int newsID;
    private boolean fromView;
    private String date;
    

    public NewsForm() {
        super();
        newsMessage = new News();
        newsList = new ArrayList<News>();
    }

    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        checkboxes = null;
        fromView = false;
    }

    public News getNewsMessage() {
        return newsMessage;
    }

    public void setNewsMessage(News newsMessage) {
        this.newsMessage = newsMessage;
    }

    public List<News> getNewsList() {
        return newsList;
    }

    public void setNewsList(List<News> newsList) {
        this.newsList = newsList;
    }

    public News getNewsEntry(int index) {
        return newsList.get(index);
    }

    public void setNewsEntry(int index, News value) {
        newsList.set(index, value);
    }

    public String[] getCheckboxes() {
        return checkboxes;
    }

    public void setCheckboxes(String[] checkboxes) {
        this.checkboxes = checkboxes;
    }

    public int getNewsID() {
        return newsID;
    }

    public void setNewsID(int newsID) {
        this.newsID = newsID;
    }

    public boolean isFromView() {
        return fromView;
    }

    public void setFromView(boolean fromView) {
        this.fromView = fromView;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
