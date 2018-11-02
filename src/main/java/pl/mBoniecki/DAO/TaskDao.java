package pl.mBoniecki.DAO;

import pl.mBoniecki.entity.Task;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import pl.mBoniecki.utils.HibernateUtils;

import java.util.List;

public class TaskDao {

    private static SessionFactory sessionFactory = HibernateUtils.getSessionFactory();

    public List<Task> findAll() {
        List<Task> tasks = null;
        try (Session session = sessionFactory.openSession()) {
            String query = "SELECT s FROM Task s";
            tasks = session.createQuery(query, Task.class).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tasks;
    }

    public void save(Task task) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(task);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void delete(Long id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Task taskToRemove = session.find(Task.class, id);
            session.delete(taskToRemove);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }
}
