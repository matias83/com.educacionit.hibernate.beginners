
package com.educacionit.hibernate.beginners.entity;


import java.util.Date;
import javax.persistence.*;


@Entity (name = "ProductDetail")
@Table (name = "product_detail")
public class ProductDetailAnnotation {


    @Id
    @GeneratedValue (strategy = GenerationType.AUTO, generator = "product_detail_seq")
    @SequenceGenerator (name="product_detail_seq", sequenceName="product_detail_seq")
    @Column(name = "prod_id")
    private Long id;

    @Column (name="prod_tax", nullable = false)
    private Long tax;

    @Column (name="prod_in", nullable = false)
    private Date in;

    @Column (name="prod_out")
    private Date out;

    @Column (name="prod_observation", length = 200, nullable = false)
    private String observation;

    @OneToOne
    @PrimaryKeyJoinColumn
    private ProductAnnotation product;


    public ProductDetailAnnotation () {

        super ();
    }

    public ProductDetailAnnotation (Long tax, Date in, String observation) {

        super ();

        this.tax = tax;
        this.in  = in;
        this.observation = observation;
    }


    public Long getId () {

        return this.id;
    }

    public void setId (Long id) {

        this.id = id;
    }


    public Long getTax () {

        return this.tax;
    }

    public void setTax (Long tax) {

        this.tax = tax;
    }

    public Date getIn () {

        return this.in;
    }

    public void setIn (Date in) {

        this.in = in;
    }

    public Date getOut () {

        return this.out;
    }

    public void setOut (Date out) {

        this.out = out;
    }

    public String getObservation () {

        return this.observation;
    }

    public void setObservation (String observation) {

        this.observation = observation;
    }

    public ProductAnnotation getProduct () {

        return this.product;
    }

    public void setProduct (ProductAnnotation product) {

        this.product = product;
    }
}