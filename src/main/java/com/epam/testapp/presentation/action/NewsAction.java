package com.epam.testapp.presentation.action;

import com.epam.testapp.database.INewsDAO;
import com.epam.testapp.model.News;
import com.epam.testapp.presentation.form.NewsForm;
import com.epam.testapp.util.Constants;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionRedirect;
import org.apache.struts.actions.MappingDispatchAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public final class NewsAction extends MappingDispatchAction {

    private final static String SUCCESS_MAPPING = "success";
    private final static String ERROR_MAPPING = "error";
    private final static String INDEX_MAPPING = "index";
    Logger logger = Logger.getLogger("com.epam.testapp.presentation");
    @Autowired
    @Qualifier("newsDAO")
    private INewsDAO newsDAO;

    public ActionForward list(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        NewsForm newsForm = (NewsForm) form;
        newsForm.setNewsList(newsDAO.getList());
        return mapping.findForward(SUCCESS_MAPPING);
    }

    public ActionForward view(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        NewsForm newsForm = (NewsForm) form;
        News news = newsDAO.fetchById(newsForm.getNewsID());
        if (news == null) {
            return mapping.findForward(ERROR_MAPPING);
        }
        newsForm.setNewsMessage(news);
        return mapping.findForward(SUCCESS_MAPPING);
    }

    public ActionForward edit(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        NewsForm newsForm = (NewsForm) form;
        News news = newsDAO.fetchById(newsForm.getNewsID());
        Date date = news.getDate();
        newsForm.setDate(Constants.FORMATTER.format(date));
        if (news == null) {
            return mapping.findForward(ERROR_MAPPING);
        }
        newsForm.setNewsMessage(news);
        return mapping.findForward(SUCCESS_MAPPING);
    }

    public ActionForward cancel(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        NewsForm newsForm = (NewsForm) form;
        if (newsForm.isFromView()) {
            ActionRedirect redirect = new ActionRedirect(mapping.findForward("view"));
            redirect.addParameter("newsID", newsForm.getNewsID());
            return redirect;
        } else {
            return mapping.findForward("list");
        }
    }

    public ActionForward delete(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        NewsForm newsForm = (NewsForm) form;
        String[] checkboxes = newsForm.getCheckboxes();
        System.out.println(checkboxes + " " + newsForm.getNewsID());
        if (checkboxes == null) {
            newsDAO.remove(newsForm.getNewsID());
        } else {
            int l = checkboxes.length;
            Integer[] ids = new Integer[l];
            for (int i = 0; i < l; i++) {
                ids[i] = Integer.parseInt(checkboxes[i]);
            }
            newsDAO.remove(ids);
        }
        return mapping.findForward(SUCCESS_MAPPING);
    }

    public ActionForward add(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        NewsForm newsForm = (NewsForm) form;
        Date date = new Date();
        newsForm.setDate(Constants.FORMATTER.format(date));
        return mapping.findForward(SUCCESS_MAPPING);
    }

    public ActionForward save(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        NewsForm newsForm = (NewsForm) form;
        News news = newsForm.getNewsMessage();
        Date date = Constants.FORMATTER.parse(newsForm.getDate());
        news.setDate(date);
        if (news.getId() != 0) {
            newsDAO.update(news);
        } else {
            int newsID = newsDAO.save(news);
            news.setId(newsID);
        }
        if (news.getId() != 0) {
            ActionRedirect redirect = new ActionRedirect(mapping.findForward(SUCCESS_MAPPING));
            redirect.addParameter("newsID", news.getId());
            return redirect;
        } else {
            return mapping.findForward(INDEX_MAPPING);
        }
    }
}
