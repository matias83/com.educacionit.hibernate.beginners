
package com.educacionit.hibernate.beginners.test;


import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.junit.jupiter.api.*;

import com.educacionit.hibernate.beginners.entity.ProductAnnotation;
import com.educacionit.hibernate.beginners.entity.ProductDetailAnnotation;
import com.educacionit.hibernate.beginners.util.HibernateUtil;


public class HibernateOneToOneAnnotationTest {


    private static SessionFactory sessionFactory;

    private static final Logger logger = LoggerFactory.getLogger (HibernateOneToOneAnnotationTest.class);


    public HibernateOneToOneAnnotationTest () {

        super ();
    }


    @BeforeAll
    public static void setup () {

        sessionFactory = HibernateUtil.getSessionAnnotationFactory ();
    }

    @AfterAll
    public static void destroy () {

        sessionFactory.close ();
    }


    @Test
    @DisplayName ("Create new records")
    public void m1 () {


        // Get a session.
        Session session = null;
        Transaction tx = null;
        try {

            logger.info("Getting a session...");
            session = sessionFactory.openSession ();
            tx = session.beginTransaction ();

            // Set the data to save.
            logger.info("Creating values to insert...");
            ProductAnnotation        p1 = new ProductAnnotation ("Apple TV", "Streaming device", Long.valueOf (100));
            ProductDetailAnnotation pd1 = new ProductDetailAnnotation (Long.valueOf (10), new Date (), "Only EEUU Enabled");
            p1.setDetail (pd1);
            pd1.setProduct (p1);

            ProductAnnotation        p2 = new ProductAnnotation ("Google Chrome Cast", "Streaming device", Long.valueOf (30));
            ProductDetailAnnotation pd2 = new ProductDetailAnnotation (Long.valueOf (4), new Date (), "Only EEUU Enabled");
            p2.setDetail (pd2);
            pd2.setProduct (p2);

            ProductAnnotation        p3 = new ProductAnnotation ("Amazon Echo", "Streaming device", Long.valueOf (199));
            ProductDetailAnnotation pd3 = new ProductDetailAnnotation (Long.valueOf (6), new Date (), "Only EEUU Enabled");
            p3.setDetail (pd3);
            pd3.setProduct (p3);

            ProductAnnotation[] values = new ProductAnnotation[] { p1, p2, p3};

            // Save the data.
            for (ProductAnnotation e : values) {

                logger.info (String.format ("Saving value %s", e.getName ()));
                session.save(e);
                logger.info (String.format ("Value %s saved!", e.getName ()));
            }
            tx.commit ();
            Assertions.assertTrue (values[0].getId () > 0, String.format ("Problems creating the new product %s", values[0].getName ()));

        } catch (Exception ex) {

            logger.error (ex.getMessage ());
            tx.rollback ();
            Assertions.assertFalse (Boolean.TRUE, "Problems executing the test.");

        } finally { session.close (); }
    }

    @Test
    @DisplayName ("Finding all products")
    public void m2 () {

        Session session = null;
        List<ProductAnnotation> products;

        try {

            logger.info ("Executing select all products.");
            logger.info("Getting a session...");
            session = sessionFactory.openSession ();

            products = (List)session.createQuery ("from Product").list ();

            Assertions.assertFalse (products.isEmpty (), "There are not products found!!!");

            logger.info ("Print all products info.");
            products.forEach ( e -> logger.info (String.format ("Product %s price %d, tax %d",
                    e.getName (), e.getPrice (), e.getDetail ().getTax ()))
            );

        } catch (Exception e) {

            logger.error (e.getMessage ());
            Assertions.assertFalse (Boolean.TRUE, "Problems executing the test.");

        } finally { session.close(); }
    }

    @Test
    @DisplayName ("Delete all products")
    public void m4 () {

        final Session session;
        Transaction tx;
        List<ProductAnnotation> values;

        try {

            logger.debug ("Delete all products.");
            session = sessionFactory.openSession ();
            tx = session.beginTransaction ();
            values = (List)session.createQuery ("From Product").list ();

            Assertions.assertFalse (values.isEmpty (), "There are not products found!!!");

            values.forEach (e -> session.delete (e));
            tx.commit ();

            values = (List)session.createQuery("From Product").list ();
            Assertions.assertTrue (values.isEmpty (), "There are products found!!!");

        } catch (Exception e) {

            logger.error (e.getMessage ());
            Assertions.assertFalse (Boolean.TRUE, "Problems executing the test.");
        }
    }
}