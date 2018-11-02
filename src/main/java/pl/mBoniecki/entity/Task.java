package pl.mBoniecki.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "tasks")
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;

    private String description;
}

